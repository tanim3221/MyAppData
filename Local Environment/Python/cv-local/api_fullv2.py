import os

import mysql.connector
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
auth_token = "Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiU2FrbGF5ZW4gIEFobWVkICIsInJvbGUiOiJTVFVERU5UIiwicmVnTm8iOiIzMzQzMCIsIm5iZiI6MTY5NzQ4MzYxNSwiZXhwIjoxNjk3NDg3MjE1LCJpYXQiOjE2OTc0ODM2MTV9.-zquDWwb48c0dURo-xbJN7Tl3VS-ZPv43jRtEGvHoMaXA0EhfTuKUTnodke5Du211nCM6x-up_65RzvnMXYR9w"

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

    # Connect to the MySQL database
    db_connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="project-cv"
    )

    # Create a cursor
    cursor = db_connection.cursor()


    # Insert data into the "general_data" table
    insert_general_data = """
    INSERT INTO general_data (regNo, regDate, regYear, periodFrom, periodTo, nationalId, name, nickname, fName, mName, preAdd,perAdd, ph, cell, email, dob, gender, nationality, fId, prinEnrNo, religion, fax, imagepath, requestedImagepath, bloodGr, entryuser, studType, imageapprovalpending, salutation, altMobNo, firmName, prinName, prinID, articleSname, genStuType)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """

    # Extract and insert data into the "general_data" table
    general_data = api_data["payload"]
    general_data_values = [
        general_data["regNo"],
        general_data["regDate"],
        general_data["regYear"],
        general_data["periodFrom"],
        general_data["periodTo"],
        general_data["nationalId"],
        general_data["name"],
        general_data["nickname"],
        general_data["fName"],
        general_data["mName"],
        general_data["preAdd"],
        general_data["perAdd"],
        general_data["ph"],
        general_data["cell"],
        general_data["email"],
        general_data["dob"],
        general_data["gender"],
        general_data["nationality"],
        general_data["fId"],
        general_data["prinEnrNo"],
        general_data["religion"],
        general_data["fax"],
        general_data["imagepath"],
        general_data["requestedImagepath"],
        general_data["bloodGr"],
        general_data["entryuser"],
        general_data["studType"],
        general_data["imageapprovalpending"],
        general_data["salutation"],
        general_data["altMobNo"],
        general_data["firmName"],
        general_data["prinName"],
        general_data["prinID"],
        general_data["articleSname"],
        general_data["genStuType"]
    ]

    # If a column has no value, you can use None or an appropriate placeholder.
    # For example, if 'nationalId' is not present in the response, you can set it to None.
    # general_data_values[5] = None

    # general_data_values = [general_data[key] for key in general_data.keys()]
    cursor.execute(insert_general_data, general_data_values)


    # Insert data into the "education_data" table
    insert_education_data = """
    INSERT INTO education_data (regNo, examName, boardUni, passYear, resultDiv, resultGpa, resultProf, resultOutOfGpa, academicLevel, group_name, certificationLevel, institute, pasRegNo)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """

    # Extract and insert data into the "education_data" table
    education_data = api_data["payload"]["stuReg2s"]
    for item in education_data:
        education_data_values = [str(item[key]) for key in item.keys()]
        cursor.execute(insert_education_data, education_data_values)

    # Commit the changes and close the connection
    db_connection.commit()
    db_connection.close()

    print("Data has been successfully inserted into the database.")

else:
    print(f"Failed to send data for registration number: {reg_no}")
    print(f"Response code: {response.status_code}")
    print(f"Response content: {response.text}")
