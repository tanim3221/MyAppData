import json
import uuid

import requests

inputText = input("Enter your English text: ")
# Add your key and endpoint
key = "57b4c5ed889842b599502012058d8612"
endpoint = "https://api.cognitive.microsofttranslator.com"

# Location, also known as region.
# Required if you're using a multi-service or regional (not global) resource. It can be found in the Azure portal on the Keys and Endpoint page.
location = "eastus"

path = '/translate'
constructed_url = endpoint + path

params = {
    'api-version': '3.0',
    'from': 'en',
    'to': 'bn'
}

headers = {
    'Ocp-Apim-Subscription-Key': key,
    # Location required if you're using a multi-service or regional (not global) resource.
    'Ocp-Apim-Subscription-Region': location,
    'Content-type': 'application/json',
    'X-ClientTraceId': str(uuid.uuid4())
}

# You can pass more than one object in body.
body = [{
    'text': inputText
}]

request = requests.post(constructed_url, params=params, headers=headers, json=body)
response = request.json()

response_string = json.dumps(response, sort_keys=True, ensure_ascii=False, indent=4, separators=(',', ': '))
print(response_string)

# Save response to txt file
with open('response.txt', 'w', encoding='utf-8') as f:
    f.write(response_string)
