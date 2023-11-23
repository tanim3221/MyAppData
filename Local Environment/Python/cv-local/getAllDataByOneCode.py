import json
import os

import requests
import urllib3

os.system('cls' if os.name == 'nt' else 'clear')

# Disable SSL verification warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)


def get_exam_admit(roll_no):
    # API endpoint
    api_url_admit = "https://exam.icab.org.bd/api/v1/ExamRegs/GetAdmitCardForOneStudent"

    payload_admit = {
        "examLevel": 62,
        "monthId": 2,
        "sessionYear": "2023",
        "rollNo": roll_no
    }


    # Authorization token
    token = open("auth_token.txt", "r")
    auth_token = token.read()

    # Set the headers with the Authorization token
    headers = {
        'Authorization': auth_token,
        'Content-Type': 'application/json',  # Adjust this as needed
    }

    try:
        # Sending POST request to the API endpoint
        response = requests.post(api_url_admit, json=payload_admit, headers=headers, verify=False)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Pretty print the JSON response
            formatted_response = json.dumps(response.json(), indent=4)
            print(formatted_response)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"An error occurred: {e}")

def get_exam_registration(reg_no):
    # API endpoint
    api_url_roll = "https://exam.icab.org.bd/api/v1/ExamRegs/GetExamRegByExamlevelMonthidSessionyearRegno"

    # Payload data
    payload = {
        "examLevel": 62,
        "monthId": 2,
        "sessionYear": "2023",
        "regNo": reg_no
    }

    # Authorization token
    token = open("auth_token.txt", "r")
    auth_token = token.read()

    # Set the headers with the Authorization token
    headers = {
        'Authorization': auth_token,
        'Content-Type': 'application/json',  # Adjust this as needed
    }

    try:
        # Sending POST request to the API endpoint
        response = requests.post(api_url_roll, json=payload, headers=headers, verify=False)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Pretty print the JSON response
            formatted_response = json.dumps(response.json(), indent=4)
            print(formatted_response)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"An error occurred: {e}")

def get_formfillup(reg_no, exam, month,year):
    # API endpoint
    url = "https://exam.icab.org.bd/api/admin/v1/FormFillup/GetFormFillupData"

    # Payload data
    payload = {
        "regNo": reg_no,
        "examLevel": exam,  # Modify as needed
        "monthId":month,
        "sessionYear": year
    }

    # Authorization token
    token = open("auth_token.txt", "r")
    auth_token = token.read()

    # Set the headers with the Authorization token
    headers = {
        'Authorization': auth_token,
        'Content-Type': 'application/json',  # Adjust this as needed
    }

    try:
        # Sending POST request to the API endpoint
        response = requests.post(url, json=payload, headers=headers, verify=False)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Pretty print the JSON response
            formatted_response = json.dumps(response.json(), indent=4)
            print(formatted_response)
        else:
            print(f"Error: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"An error occurred: {e}")

intinput = input(
        '''\nWhat do you want:\n\n'''
        '''1. Student Roll No\n'''
        '''2. Student Admit Card\n'''
        '''3. Form Fillup Info\n'''
        '''Enter your choice: '''
)

if intinput=="1":
    reg_no = input("Enter regNo: ")
    get_exam_registration(reg_no)
elif intinput=="2":
    roll_no = input("Enter RollNo: ")
    get_exam_admit(roll_no)
elif intinput=="3":
    regNo = input("Enter regNo: ")
    exam = input("61. CERTIFICATE LEVEL, 62. PROFESSIONAL LEVEL, 63. ADVANCED LEVEL : ")
    month = input("1. May-June, 2. Nov-Dec, 3. March-April, 4. July-August : ")
    year = input("Enter Year (e.g 2023): ")
    get_formfillup(regNo, exam, month, year)