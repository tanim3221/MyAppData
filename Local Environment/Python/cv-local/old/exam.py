import json
import os

import requests

os.system('cls' if os.name == 'nt' else 'clear')

# Define the request URL
url = "https://exam.icab.org.bd/api/admin/v1/FormFillup/GetFormFillupData"

# Authorization token
token = open("auth_token.txt", "r")
auth_token = token.read()

# Set the headers with the Authorization token
headers = {
    'Authorization': auth_token,
    "Accept": "application/json",
    "Content-Type": "application/json"
}

reg = int(input("Enter Registration No: "))
examLevel = int(input("Enter Exam Level: "))

# Define the payload data
payload = {
    "regNo": reg,
    "examLevel": examLevel,
    "monthId": 2,
    "sessionYear": 2023
}

# Send the POST request
response = requests.post(url, headers=headers, json=payload, verify=False)

# Check the status code
if response.status_code == 200:
    # Pretty-print the JSON response
    response_json = response.json()
    print(json.dumps(response_json, indent=4))
else:
    print(f"Request failed with status code {response.status_code}")
