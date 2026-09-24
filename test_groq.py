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
    print("ACTIVE GROQ MODELS:")
    for m in models:
        print(f"- {m['id']}")
else:
    print("Failed to fetch models:", response.text)
