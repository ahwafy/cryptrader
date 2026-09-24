import os
import requests
from dotenv import load_dotenv

load_dotenv(os.path.join(os.path.dirname(__file__), '.env'))
api_key = os.getenv("GROQ_API_KEY")

url = "https://api.groq.com/openai/v1/models"
headers = {"Authorization": f"Bearer {api_key}"}
response = requests.get(url, headers=headers)

if response.status_code == 200:
    models = response.json().get('data', [])
    valid_models = []
    
    for m in models:
        model_id = m['id']
        test_url = "https://api.groq.com/openai/v1/chat/completions"
        payload = {"model": model_id, "messages": [{"role": "user", "content": "hi"}], "temperature": 0.0}
        
        test_resp = requests.post(test_url, json=payload, headers=headers)
        if test_resp.status_code == 200:
            print(f"[SUCCESS] {model_id} is active and accessible.")
            valid_models.append(model_id)
        else:
            print(f"[ERROR] {model_id} failed: {test_resp.text}")
            
    print("\nFully Accessible Models:", valid_models)
else:
    print("Failed to fetch models.")
