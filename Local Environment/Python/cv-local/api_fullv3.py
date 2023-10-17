import os
import time

import mysql.connector
import requests
import urllib3

os.system('cls' if os.name == 'nt' else 'clear')

# Disable SSL verification warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# URL for the new API endpoint
api_url = "https://exam.icab.org.bd/api/v1/StudentRegistrationAndUpdate/GetStudent"

# Authorization token
token = open("auth_token.txt", "r")
auth_token = token.read()

# Set the headers with the Authorization token
headers = {
    'Authorization': auth_token,
    'Content-Type': 'application/json',  # Adjust this as needed
}

# Range of registration numbers from 1 to 40000
start_reg_no = int(input("Enter start reg no: "))
end_reg_no = int(input("Enter end reg no: "))

# Define db_connection outside the loop
db_connection = None

for reg_no in range(start_reg_no, end_reg_no + 1):
    # Create the payload with the current registration number
    payload = {"regNo": reg_no}

    try:
        # Send a POST request to the API with authentication
        response = requests.post(api_url, json=payload,
                                headers=headers, verify=False)

        # Check the response status and display a message for each registration number
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

            print(f"Data inserted for reg no: {reg_no}")

        else:
            if response.status_code == 404:
                print(f"[{response.status_code}] Data not found for reg no: {reg_no}")
            else:
                print(f"[{response.status_code}] Failed to send data for reg no: {reg_no}")
                break
    except Exception as e:
        print(f"Error for reg no {reg_no}: {str(e)}")
    finally:
        # Close the database connection in the finally block to ensure it's always closed
        if db_connection:
            db_connection.close()
    
    # time.sleep(1)

# Close the database connection after processing all registration numbers
if db_connection:
    db_connection.close()