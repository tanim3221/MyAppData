import json
import os

import requests
import urllib3

os.system('cls' if os.name == 'nt' else 'clear')

# Disable SSL verification warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# URL for the new API endpoint
api_url = "https://exam.icab.org.bd/api/v1/StudentRegistrationAndUpdate/GetStudent"

# Get the registration number from the user
reg_no = input("Enter the registration number: ")

# Create the payload with the provided registration number
payload = {"regNo": reg_no}

# Authorization token
token = open("auth_token.txt", "r")
auth_token = token.read()

# Set the headers with the Authorization token
headers = {
    'Authorization': auth_token,
    'Content-Type': 'application/json',  # Adjust this as needed
}

# Send a POST request to the API with authentication
response = requests.post(api_url, json=payload, headers=headers, verify=False)

# Check the response status and display JSON response in the console
if response.status_code == 200:
    api_data = response.json()
    # print(api_data)
    print(json.dumps(api_data, indent=4))
    # You can also process the JSON data as needed
else:
    print(f"Failed to send data for registration number: {reg_no}")
    print(f"Response code: {response.status_code}")
    print(f"Response content: {response.text}")
