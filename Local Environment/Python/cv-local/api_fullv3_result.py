import os
import time
from datetime import datetime

import mysql.connector
import requests
import urllib3
import json

os.system('cls' if os.name == 'nt' else 'clear')

urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

RESULT_API = "https://exam.icab.org.bd/api/v1/ExamRegs/get-grade-sheet-single"
GET_EXAM_DETAILS = "https://exam.icab.org.bd/api/v1/ExamRegs/GetExamRegByExamlevelMonthidSessionyearRegno"

token = open("auth_token.txt", "r")
auth_token = token.read()
headers = {
    'Authorization': auth_token,
    'Content-Type': 'application/json',
}

start_reg_no = int(input("Enter start reg no: "))
end_reg_no = int(input("Enter end reg no: "))
# year = input("Enter Year: ")
curr_date = datetime.now()

monthid =2 
year =2023 

db_connection = None

with open("./error-result/range.txt" , 'a') as file:
    file.write(f"{start_reg_no}-{end_reg_no} for {year}-{monthid}\n")

def get_result(reg_no, exam, year, monthid):

    roll_no = get_roll_no(reg_no, exam, year, monthid)
    
    payload = {
        "monthId": monthid,
        "examLevel": exam,
        "sessionYear": year,
        "rollNo": roll_no
    }
    response = requests.post(RESULT_API, json=payload, headers=headers, verify=False)
        
    if response.status_code == 200:
        data = response.json()
        return data
    else:
        if response.status_code == 404 or roll_no == None:
            return None
        else:
            return False


def get_roll_no(reg_no, exam, year, monthid):

    payload = {
        "examLevel": exam,
        "monthId": monthid,
        "sessionYear": year,
        "regNo": reg_no
    }

    response = requests.post(GET_EXAM_DETAILS, json=payload, headers=headers, verify=False)
    if response.status_code == 200:
        data = response.json()
        return data.get('payload', {}).get('examRollno')
    else:
        if response.status_code == 404:
            return None
        else:
            return False


for reg_no in range(start_reg_no, end_reg_no + 1):
    for exam in range(61,64):
        result_data = get_result(reg_no=reg_no, exam=exam, year=year, monthid=monthid)
        try:
            if isinstance(result_data, dict) and result_data.get('success') == True:
                
                db_connection = mysql.connector.connect(
                    host="localhost",
                    user="root",
                    password="",
                    database="project-cv"
                )
                cursor = db_connection.cursor()
                insert_general_data = """
                INSERT INTO results (result, session, year, reg_no, level, date_added)
                VALUES (%s, %s, %s, %s, %s, %s)
                """
                general_data = result_data["payload"]
                grades_json = json.dumps(general_data["output"])
                general_data_values = [
                    grades_json,
                    general_data["monthName"],
                    year,
                    general_data["regNo"],
                    general_data["examLevelName"],
                    curr_date,
                ]
                cursor.execute(insert_general_data, general_data_values)
                db_connection.commit()
                print(f"Data inserted for reg no: {reg_no}-{exam}")

            else:
                if result_data == None:
                    print(f"Data not found for reg no: {reg_no}-{exam}")
                    with open(f"./error-result/not_found-{exam}.txt", "a") as file:
                        file.write(f"{reg_no},")
                else:
                    print(f"Failed to send data for reg no: {reg_no}-{exam}")
                    with open(f"./error-result/failed-{exam}.txt", "a") as file:
                        file.write(f"{reg_no},")
                    break
        except Exception as e:
            print(f"Error for reg no {reg_no}-{exam}")
            with open(f"./error-result/error-{exam}.txt", "a") as file:
                file.write(f"{reg_no},")
            break
        finally:
            if db_connection:
                db_connection.close()
                
    # time.sleep(1)

if db_connection:
    db_connection.close()
