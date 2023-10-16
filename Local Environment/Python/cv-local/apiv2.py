import os

import certifi
import mysql.connector
import requests
import urllib3

os.system('cls' if os.name == 'nt' else 'clear')

# Disable SSL verification warnings
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

# URL for the API endpoint
api_url = "https://exam.icab.org.bd/api/v1/Account/existing-student-signup"

# Database connection details
db_config = {
    "host": "localhost",
    "user": "root",
    "password": "",
    "database": "project-cv"
}

# Open the text file for reading
with open("reg_numbers.txt", "r") as file:
    # Create a MySQL database connection
    db = mysql.connector.connect(**db_config)
    cursor = db.cursor()

    # Iterate through each line in the file
    for line in file:
        # Split the line using a comma as the separator
        reg_numbers = line.strip().split(',')
        
        for reg_no in reg_numbers:
            # Create the payload with the dynamic registration number
            payload = {"regNo": reg_no}

            # Send a POST request to the API
            response = requests.post(api_url, json=payload, verify=False)

            # Check the response status and insert data into the database
            if response.status_code == 200:
                api_data = response.json()

                # Extract data from the API response
                reg_no = api_data.get("regNo", "")
                email = api_data.get("email", "")
                dob = api_data.get("dob", "")
                name = api_data.get("name", "")
                cell = api_data.get("cell", "")

                # Define the SQL query to insert data into the 'main_info_new' table
                insert_query = "INSERT INTO main_info_new (reg_no, name, mobile, email, birthday, photo, photo_inserted) VALUES (%s, %s, %s, %s, %s, %s, 0)"

                # Execute the query with the extracted data
                cursor.execute(insert_query, (reg_no, name, cell, email, dob, ""))

                # Commit the changes to the database
                db.commit()

                print(f"Successfully inserted data for registration number: {reg_no}")
            else:
                print(f"Failed to insert data for registration number: {reg_no}")
                print(f"Response code: {response.status_code}")
                print(f"Response content: {response.text}")

    # Close the database connection
    cursor.close()
    db.close()
