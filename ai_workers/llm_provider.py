import os
import json
import requests
from google import genai
from dotenv import load_dotenv

env_path = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), '.env')
load_dotenv(env_path, override=True)

class LLMProvider:
    def __init__(self):
        # Set up remote Ollama configurations
        self.ollama_host = os.getenv("OLLAMA_HOST", "http://192.168.1.9:11434")
        self.ollama_model = os.getenv("OLLAMA_MODEL", "phi4-mini:latest")
        
        # Task-specific local LLM models (defaulting to the main OLLAMA_MODEL)
        self.ollama_model_news = os.getenv("OLLAMA_MODEL_NEWS", self.ollama_model)
        self.ollama_model_signal = os.getenv("OLLAMA_MODEL_SIGNAL", self.ollama_model)
        self.ollama_model_decision = os.getenv("OLLAMA_MODEL_DECISION", self.ollama_model)
        
        # Core Router Config
        self.llm_driver = os.getenv("LLM_DRIVER", "ollama")
        
        # Set up Gemini client for teacher auditor
        self.gemini_key = os.getenv("GEMINI_API_KEY")
        self.gemini_model = os.getenv("GEMINI_MODEL", 'gemma-4-31b-it')
        self.gemini_strategic_model = os.getenv("GEMINI_STRATEGIC_MODEL", "gemini-2.5-flash")
        self.gemini_auditor_model = os.getenv("GEMINI_AUDITOR_MODEL", "gemini-2.5-flash")
        
        self.groq_api_key = os.getenv("GROQ_API_KEY")
        self.exhausted_groq_models = []
        self.groq_models = [
            "openai/gpt-oss-20b",
            "qwen/qwen3.6-27b"
        ]
        
        if self.gemini_key:
            self.gemini_client = genai.Client(api_key=self.gemini_key)
        else:
            self.gemini_client = None

    def query_local_ollama(self, prompt, model=None):
        """Sends a request to the local Linux GPU Ollama instance."""
        target_model = model if model else self.ollama_model
        try:
            url = f"{self.ollama_host}/api/generate"
            payload = {
                "model": target_model,
                "prompt": prompt,
                "stream": False,
                "format": "json"
            }
            response = requests.post(url, json=payload, timeout=5)
            if response.status_code == 200:
                response_json = response.json()
                return self._parse_json(response_json.get("response", ""))
            else:
                print(f"Ollama returned status code: {response.status_code}")
                return None
        except Exception as e:
            print(f"Ollama Server Connection Error: {e}")
            return None

    def query_groq(self, prompt, model="openai/gpt-oss-20b"):
        if not self.groq_api_key: return None
        url = "https://api.groq.com/openai/v1/chat/completions"
        headers = {"Authorization": f"Bearer {self.groq_api_key}", "Content-Type": "application/json"}
        import requests
        import time
        
        # Determine starting model
        target_model = model
        if target_model in self.exhausted_groq_models:
            for fallback in self.groq_models:
                if fallback not in self.exhausted_groq_models:
                    target_model = fallback
                    break
            
            if target_model in self.exhausted_groq_models:
                print("All Groq models are currently exhausted! Forcing fallback.")
                return None
                
        payload = {"model": target_model, "messages": [{"role": "user", "content": prompt}], "temperature": 0.0}
        
        max_retries = 3
        for attempt in range(max_retries):
            try:
                response = requests.post(url, json=payload, headers=headers, timeout=10)
                response.raise_for_status()
                text = response.json()['choices'][0]['message']['content']
                return self._parse_json(text)
            except requests.exceptions.HTTPError as e:
                if response.status_code == 429:
                    if attempt < max_retries - 1:
                        # Parse retry-after, handle Groq's long daily limits
                        try:
                            retry_after = float(response.headers.get("Retry-After", 3.0))
                        except ValueError:
                            retry_after = 3.0
                            
                        # Groq often hits Daily Token Limits requiring minutes/hours of wait.
                        if retry_after > 10.0:
                            print(f"Groq Daily Limit Hit for {target_model}. Adding to exhausted list and rotating...")
                            if target_model not in self.exhausted_groq_models:
                                self.exhausted_groq_models.append(target_model)
                            return self.query_groq(prompt) # Retry from top to select next available
                            
                        print(f"Groq Rate Limit Exceeded (429) on {target_model}. Retrying in {retry_after}s...")
                        time.sleep(retry_after)
                        continue
                raise e
        return None

    def query_local_news(self, prompt):
        """Queries Groq, then Gemini, then local Ollama specifically for news classification."""
        if self.groq_api_key:
            try:
                result = self.query_groq(prompt, model="openai/gpt-oss-20b")
                if result: return result
            except Exception as e:
                print(f"Groq API Error: {e}. Falling back to Gemini...")
        
        if self.llm_driver == "gemini":
            return self.query_gemini(prompt)
        return self.query_local_ollama(prompt, model=self.ollama_model_news)

    def query_local_decision(self, prompt):
        """Queries local Ollama specifically for risk/early exit decision making."""
        if self.llm_driver == "gemini":
            return self.query_gemini(prompt)
            
        try:
            url = f"{self.ollama_host}/api/generate"
            payload = {
                "model": self.ollama_model_decision,
                "prompt": prompt,
                "stream": False,
                "format": "json"
            }
            response = requests.post(url, json=payload, timeout=10)
            if response.status_code == 200:
                response_json = response.json()
                raw_text = response_json.get("response", "")
                
                # Strip DeepSeek thinking block if present
                if "</think>" in raw_text:
                    raw_text = raw_text.split("</think>")[-1]
                    
                if "```json" in raw_text:
                    raw_text = raw_text.split("```json")[1].split("```")[0]
                elif "```" in raw_text:
                    raw_text = raw_text.split("```")[1].split("```")[0]
                return json.loads(raw_text.strip())
            return None
        except Exception as e:
            print(f"Error querying local decision LLM: {e}")
            return None

    def _query_gemini(self, prompt):
        if self.groq_api_key:
            try:
                result = self.query_groq(prompt, model="openai/gpt-oss-20b")
                if result: return result
            except Exception as e:
                print(f"Groq API Error in executor: {e}")
                
        if self.llm_driver == "gemini":
            return self.query_gemini(prompt)
        return self.query_local_ollama(prompt, model=self.ollama_model_signal)

    def query_gemini(self, prompt):
        """Sends a request to the Gemini API with automatic fallback to local Ollama on rate limits or failures."""
        if not self.gemini_client:
            print("Gemini API Client not configured. Falling back to local Ollama...")
            return self.query_local_ollama(prompt)
            
        import time
        max_retries = 3
        for attempt in range(max_retries):
            try:
                response = self.gemini_client.models.generate_content(
                    model=self.gemini_model,
                    contents=prompt
                )
                if not response.text:
                    err_msg = f"Gemini Refusal/Empty Response: {response}. Falling back to local Ollama..."
                    print(err_msg)
                    with open("gemini_errors.log", "a") as f: f.write(err_msg + "\n")
                    return self.query_local_ollama(prompt)
                
                return self._parse_json(response.text)
            except Exception as e:
                err_str = str(e)
                if "500" in err_str:
                    if attempt == max_retries - 1:
                        err_msg = "Gemini 500 Internal error exceeded max retries. Falling back to local Ollama..."
                        print(err_msg)
                        with open("gemini_errors.log", "a") as f: f.write(err_msg + "\n")
                        return self.query_local_ollama(prompt)
                    print("Gemini 500 Internal error caught. Sleeping 3 seconds and retrying...")
                    time.sleep(3)
                elif "429" in err_str:
                    if attempt == max_retries - 1:
                        err_msg = "Gemini rate limit exceeded max retries. Falling back to local Ollama..."
                        print(err_msg)
                        with open("gemini_errors.log", "a") as f: f.write(err_msg + "\n")
                        return self.query_local_ollama(prompt)
                    wait_time = (attempt + 1) * 30
                    print(f"Rate limited (429) in LLMProvider. Waiting {wait_time}s...")
                    time.sleep(wait_time)
                else:
                    err_msg = f"Gemini Exception: {e}. Falling back to local Ollama..."
                    print(err_msg)
                    with open("gemini_errors.log", "a") as f: f.write(err_msg + "\n")
                    return self.query_local_ollama(prompt)
        return None

    def query_strategic_gemini(self, prompt: str):
        """Dedicated method that strictly uses gemini-2.5-flash to save the 20 RPD cap with Groq Fallback."""
        if not self.gemini_client:
            print("Gemini client not initialized. Falling back to Groq / Ollama for strategic query...")
            return self._query_gemini(prompt)
        import time
        max_retries = 2
        for attempt in range(max_retries):
            try:
                response = self.gemini_client.models.generate_content(
                    model=self.gemini_strategic_model,
                    contents=prompt
                )
                if response.text:
                    return self._parse_json(response.text)
            except Exception as e:
                print(f"Strategic Gemini Exception: {e}. Attempt {attempt+1}/{max_retries}...")
                time.sleep(2)
                
        # Fall back to Groq or local LLM if Gemini fails (e.g. hits 20 RPD cap)
        print("Strategic Gemini failed or hit RPD cap. Falling back to Groq / Local LLM...")
        return self._query_gemini(prompt)

    def query_auditor_gemini(self, prompt: str):
        """Dedicated method that uses gemini-2.5-flash for the Auditor with Groq fallback."""
        if not self.gemini_client:
            print("Gemini client not initialized. Falling back to Groq / Ollama for auditor...")
            return self._query_gemini(prompt)
        import time
        max_retries = 2
        for attempt in range(max_retries):
            try:
                response = self.gemini_client.models.generate_content(
                    model=self.gemini_auditor_model,
                    contents=prompt
                )
                if response.text:
                    return self._parse_json(response.text)
            except Exception as e:
                print(f"Auditor Gemini Exception: {e}. Attempt {attempt+1}/{max_retries}...")
                time.sleep(2)
        
        # Fall back to Groq or local LLM if Gemini fails
        print("Auditor Gemini failed after retries. Falling back to Groq / Local LLM...")
        return self._query_gemini(prompt)

    def _parse_json(self, text):
        try:
            # Strip DeepSeek thinking block if present
            if "</think>" in text:
                text = text.split("</think>")[-1]
                
            if "```json" in text:
                text = text.split("```json")[1].split("```")[0]
            elif "```" in text:
                text = text.split("```")[1].split("```")[0]
            
            return json.loads(text.strip())
        except Exception as e:
            print(f"JSON Parse Error: {e} | Raw Text Attempted: {repr(text)}")
            return {
                "asset": "UNKNOWN",
                "sentiment": 0.0,
                "action": "HOLD"
            }

if __name__ == "__main__":
    provider = LLMProvider()
    print("Testing connection to Linux GPU server...")
    result = provider.query_local_ollama("BTC looks bullish, heading to 100k!")
    print(f"Ollama Result: {result}")
