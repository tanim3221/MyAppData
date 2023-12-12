import smtplib as smtp
import random as rd
import pandas as pd
import datetime as dt


HOST = "smtp.gmail.com"
MY_MAIL = "myicche@gmail.com"
MY_PASSWORD = "vltwzqjiwczsiuaq"

today = dt.datetime.now()
today_tuple = (today.month, today.day)
data = pd.read_csv("./birthdays.csv")

birthdays_dict = {(data_row['month'],data_row['day']): data_row for (index, data_row) in data.iterrows()}

if today_tuple in birthdays_dict:
    birthday_person = birthdays_dict[today_tuple]
    file_path = f"./letter_templates/letter_{rd.randint(1,3)}.txt"
    with open(file_path) as letter_file:
        contents = letter_file.read()
        contents = contents.replace("[NAME]", birthday_person['name'])

    with smtp.SMTP(HOST, 587) as conn:
        conn.starttls()
        conn.login(MY_MAIL, MY_PASSWORD)
        conn.sendmail(
            from_addr=MY_MAIL,
            to_addrs=birthday_person['email'],
            msg=f"Subject:Happy Birthday\n\n{contents}")


