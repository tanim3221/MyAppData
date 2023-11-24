import json
import os

import mysql.connector
import requests
import urllib3

os.system('cls' if os.name == 'nt' else 'clear')


# Disable the "InsecureRequestWarning"
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

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

# Input the range of registration numbers
start_reg = int(input("Enter the start Registration No: "))
end_reg = int(input("Enter the end Registration No: "))

# Establish a connection to your MySQL database (modify the connection parameters)
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="project-cv"
)

# Create a cursor to interact with the database
cursor = connection.cursor()

# Create a table to store JSON data (modify the table structure)
cursor.execute('''
    CREATE TABLE IF NOT EXISTS examCertificate (
        RegistrationNo INT,
        JSONData JSON
    )
''')
connection.commit()
try:
    # Fetch and insert JSON data for the specified range of registration numbers
    for reg in range(start_reg, end_reg + 1):
        payload = {
            "regNo": reg,
            "examLevel": 61,  # Modify as needed
            "monthId": 2,
            "sessionYear": 2023
        }

        # Send the POST request
        response = requests.post(url, headers=headers,
                                 json=payload, verify=False)

        if response.status_code == 200:
            # Get the JSON data
            json_data = json.dumps(response.json())

            # Insert the JSON data into the database
            cursor.execute(
                "INSERT INTO examCertificate (RegistrationNo, JSONData) VALUES (%s, %s)", (reg, json_data))
            connection.commit()
            print(f"Data insertion for {reg}.")
        else:
            if response.status_code == 404:
                print(f"[{response.status_code}] Data not found for reg no: {reg}")
            else:
                print(
                    f"[{response.status_code}] Failed to send data for reg no: {reg}")
                break
except Exception as e:
    print(f"Error for reg no {reg}: {str(e)}")

# Close the database connection
connection.close()
