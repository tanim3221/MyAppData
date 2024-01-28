import requests

url = "https://api.saklayen.cf/assets/api/public"
payload = {
    "tables": [
        "personalinfo",
        "social_links"
    ],
    "userType": "enduser"
}

headers = {
    'Content-Type': 'application/json',
}

response = requests.post(url, json=payload, headers=headers, verify=False)

if response.status_code == 200:
    print("Request successful. Response:")
    print(response.json())
else:
    print(f"Request failed with status code {response.status_code}. Response:")
    print(response.text)
