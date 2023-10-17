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
auth_token = "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiU2FrbGF5ZW4gIEFobWVkICIsInJvbGUiOiJTVFVERU5UIiwicmVnTm8iOiIzMzQzMCIsIm5iZiI6MTY5NzUxMjU1OCwiZXhwIjoxNjk3NTE2MTU4LCJpYXQiOjE2OTc1MTI1NTh9.8e7EAVFAx75gTQHNA56h0wGttku-gYUTSQRhR0wLKhUby9rw--TWFX_Sav87FsPJH4wFDonqJifIAC9OL_KzIw"

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
    print(api_data)
    # You can also process the JSON data as needed
else:
    print(f"Failed to send data for registration number: {reg_no}")
    print(f"Response code: {response.status_code}")
    print(f"Response content: {response.text}")
