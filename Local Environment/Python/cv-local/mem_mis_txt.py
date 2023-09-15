import base64
import logging
import os
import re
import time
from urllib.parse import urlparse

import mysql.connector
import requests
import urllib3
from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

logging.basicConfig(level=logging.INFO)
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

URL = 'https://www.icab.org.bd/page/find-member'
options = webdriver.ChromeOptions()
options.add_argument("--log-level=3")
options.add_argument("--headless")
options.add_argument("--disable-gpu")
options.add_argument("window-size=1400,2100")
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("start-maximized")
options.add_argument(
    "user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36")

driver_path = 'chromedriver-win64/chromedriver.exe'
driver = webdriver.Chrome(executable_path=driver_path, options=options)
driver.get(URL)

def create_db_connection():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='',
        database='project-cv'
    )
    cursor = conn.cursor()
    return conn, cursor

def get_filename_from_url(url):
    """
    Get a valid filename from a given URL.
    """
    path = urlparse(url).path
    filename = os.path.basename(path)
    return filename


def download_image(url):
    try:
        if not url.startswith(('http://', 'https://')):
            # print(f"Invalid URL: {url}")
            return None

        if 'https' in url and '8084' in url:
            url = url.replace('https', 'http')

        response = requests.get(url, verify=False)
        if response.status_code == 200:
            image_base64 = base64.b64encode(response.content).decode('utf-8')
            return image_base64
        else:
            print(
                f"Error downloading the image {url}. Status code: {response.status_code}")
            return None
    except requests.exceptions.SSLError as e:
        print(f"SSL Error encountered for {url}. Error: {e}")
        return None
    except Exception as e:
        print(f"Error downloading {url}. Error: {e}")
        return None


def scrape_page():
    soup = BeautifulSoup(driver.page_source, 'lxml')
    members_data = []

    for member in soup.select('.member-list-single'):
        data = {}

        # Image
        img_tag = member.select_one('img')
        if img_tag:
            image_url = img_tag['src']
            data['image'] = image_url
            saved_image_base64 = download_image(image_url)
            data['image_base64'] = saved_image_base64

        # Name
        name_tag = member.select_one('h3')
        if name_tag:
            data['last_name'] = name_tag.contents[0].strip().split(',')[
                0].strip()
            span_tag = name_tag.select_one('span')
            data['first_name'] = span_tag.text if span_tag else ""

        # Education
        education_tag = member.select_one('p')
        data['education'] = education_tag.text.strip() if education_tag else ''

        # ICAB details
        icab_tags = member.select('p')
        for icab_text in icab_tags:
            text_content = icab_text.text.strip()
            matches = re.search(
                r"(ACA|FCA) \((\d{2}/\d{2}/\d{4})\) \((\d+)\)", text_content)
            if matches:
                data['qualification'] = matches.group(1)
                data['qualification_date'] = matches.group(2)
                data['enrollment_no'] = matches.group(3)
                break  # Once found, break out of the loop
            else:
                data['icab'] = text_content

        # Position and Firm
        h4_tag = member.select_one('h4')
        if h4_tag:
            # Get the preceding p tag (position) relative to the h4 tag
            position_tag = h4_tag.find_previous_sibling('p')
            data['position'] = position_tag.text.strip() if position_tag else ''

            # Check if h4 contains the firm name, or save it directly if it exists
            data['firm'] = h4_tag.text.strip()
        else:
            data['position'] = ''
            data['firm'] = None

        # Retrieve mobile number
        mobile_tag = member.select_one('p:contains("(M)")')
        if mobile_tag:
            data['phone'] = mobile_tag.text.split(')')[-1].strip()
            address_tag = mobile_tag.find_previous('p')
            if address_tag:
                data['address'] = address_tag.text.strip()
        else:
            h4_tag = member.select_one('h4')
            if h4_tag:
                # Check for the address right after the firm name
                next_p_tag = h4_tag.find_next_sibling('p')
                if next_p_tag:
                    data['address'] = next_p_tag.text.strip()
            else:
                # Get the address that is immediately after the <hr> tag
                hr_tag = member.select_one('hr')
                if hr_tag:
                    next_p_after_hr = hr_tag.find_next_sibling('p')
                    if next_p_after_hr:
                        data['address'] = next_p_after_hr.text.strip()
                else:
                    data['address'] = ''

        email_tag = member.select_one('p:contains("(E)")')
        if email_tag:
            data['email'] = email_tag.text.split(')')[-1].strip()
        # if data.get('enrollment_no') in missing_enrollment_numbers:
        
        members_data.append(data)
    return members_data


def close_db_connection(conn, cursor):
    if conn.is_connected():
        cursor.close()
        conn.close()
        logging.info("MySQL connection is closed")


def insert_to_sql(data_list, cursor, conn):
    try:
        for member_data in data_list:
            # Check if member with the same enrollment number exists
            check_query = "SELECT COUNT(*) FROM mem_mis WHERE enrollment_number = %s"
            cursor.execute(
                check_query, (member_data.get('enrollment_no', ''),))
            result = cursor.fetchone()

            if result[0] == 0:
                query = """INSERT INTO mem_mis 
                    (image, image_base64, first_name, last_name, education, icab, qualification, qualification_date, enrollment_number, position, firm, address, mobile, email) 
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
                values = (
                    member_data.get('image', ''),
                    member_data.get('image_base64', ''),
                    member_data.get('first_name', ''),
                    member_data.get('last_name', ''),
                    member_data.get('education', ''),
                    member_data.get('icab', ''),
                    member_data.get('qualification', ''),
                    member_data.get('qualification_date', ''),
                    member_data.get('enrollment_no', ''),
                    member_data.get('position', ''),
                    member_data.get('firm', ''),
                    member_data.get('address', ''),
                    member_data.get('phone', ''),
                    member_data.get('email', '')
                )
                cursor.execute(query, values)
                conn.commit()
                logging.info(f"Scraped and inserted : {member_data.get('enrollment_no')}.")

            else:
                logging.info(
                    f"Member with enrollment no {member_data.get('enrollment_no')} already exists.")
    except mysql.connector.Error as err:
        logging.error(f"Error during insertion: {err}")


with open('mis_mem_01.txt', 'r') as file:
    enrollment_numbers_to_search = file.read().splitlines()

enrollment_numbers_to_search = enrollment_numbers_to_search[::-1]

# enrollment_numbers_to_search = [str(i).zfill(4) for i in range(1, 2251)]
# enrollment_numbers_to_search = enrollment_numbers_to_search[::-1]

conn, cursor = create_db_connection()
if not conn or not cursor:
    logging.error("Failed to connect to the database!")
    exit()

try:
    for enrollment_number in enrollment_numbers_to_search:
        # Enter the enrollment number into the search box and click the submit button.
        search_box = WebDriverWait(driver, 15).until(
            EC.presence_of_element_located((By.CSS_SELECTOR, ".member-search-box input[type='text']"))
        )
        search_box.clear()
        search_box.send_keys(enrollment_number)

        submit_button = driver.find_element_by_css_selector(".member-search-box input[type='submit']")
        submit_button.click()

        # Wait for results to load (you may adjust the wait time as needed).
        time.sleep(2)

        # Check if "No Member Found" is displayed.
        page_content = driver.page_source
        if "No Member Found" not in page_content:
            scraped_data = scrape_page()
            if scraped_data:
                insert_to_sql(scraped_data, cursor, conn)
                logging.info(f"Scraped and inserted data for enrollment number {enrollment_number}.")
            else:
                logging.warning(f"No data scraped for enrollment number {enrollment_number}.")

except Exception as e:
    logging.error(f"Error during the process: {e}")
finally:
    driver.quit()
    close_db_connection(conn, cursor)

conn, cursor = create_db_connection()
if not conn or not cursor:
    logging.error("Failed to connect to the database!")
    exit()