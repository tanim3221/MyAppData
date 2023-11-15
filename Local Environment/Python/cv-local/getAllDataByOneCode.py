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

def update_info():
    # API endpoint
    api_url = "https://exam.icab.org.bd/api/v1/StudentRegistrationAndUpdate/UpdateStudent"

    # Payload data
    payload_ = {
        "regNo": 33430,
        "regDate": "2021-06-12T00:00:00",
        "regYear": 2021,
        "periodFrom": "2021-04-06T00:00:00",
        "periodTo": "2024-04-05T00:00:00",
        "nationalId": "",
        "name": "Saklayen  Ahmed ",
        "nickname": "",
        "fName": "Tazuddin Ahmed",
        "mName": "Manwara Begum",
        "preAdd": "Shohor Banu Villa, House GP/CHA/180/2, Road #2, TB Gate, Mohakhali, Dhaka",
        "perAdd": "Vill- Pashchim Khanda, po- Mawna, ps- Sreepur, Dis Gazipur",
        "ph": "",
        "cell": "01727268458",
        "email": "saklayen.3221@gmail.com",
        "dob": "1997-04-25T00:00:00",
        "gender": "M",
        "nationality": "Bangladeshi",
        "fId": 0,
        "prinEnrNo": 0,
        "religion": "Islam",
        "fax": "",
        "imagepath": "https://s3.brilliant.com.bd/icab-exam/studentDocument/33430/33430.jpeg",
        "requestedImagepath": "",
        "bloodGr": "",
        "entryuser": "ADMIN",
        "studType": 1,
        "imageapprovalpending": 0,
        "salutation": "Mr",
        "altMobNo": "",
        "firmName": "Nurul Faruk Hasan & Co",
        "prinName": "Mr Md Faruk Uddin Ahammed FCA",
        "prinID": 0,
        "articleSname": "",
        "genStuType": 0,
        "stuReg2s": [
            {
                "regNo": 33430,
                "examName": "BBA",
                "boardUni": "University Of Rajshahi",
                "passYear": 2018,
                "resultDiv": 0,
                "resultGpa": 3.37,
                "resultProf": "",
                "resultOutOfGpa": 4,
                "academicLevel": "Graduation",
                "group": "AIS",
                "certificationLevel": "BBA",
                "institute": "",
                "pasRegNo": ""
            },
            {
                "regNo": 33430,
                "examName": "HSC",
                "boardUni": "Dhaka Board",
                "passYear": 2014,
                "resultDiv": 0,
                "resultGpa": 5,
                "resultProf": "",
                "resultOutOfGpa": 5,
                "academicLevel": "Higher Secondary",
                "group": "Busines Studies",
                "certificationLevel": "HSC",
                "institute": "",
                "pasRegNo": ""
            },
            {
                "regNo": 33430,
                "examName": "SSC",
                "boardUni": "Dhaka Board",
                "passYear": 2012,
                "resultDiv": 0,
                "resultGpa": 4.88,
                "resultProf": "",
                "resultOutOfGpa": 5,
                "academicLevel": "Secondary",
                "group": "Busines Studies",
                "certificationLevel": "SSC",
                "institute": "",
                "pasRegNo": ""
            }
        ]
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
        response = requests.post(api_url, json=payload, headers=headers, verify=False)

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
