import csv
import os
import time

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.keys import Keys


# Function to save data to a CSV file
def save_data_to_csv(data, filename):
    with open(filename, 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)
        # Write header row with the specified columns
        csv_writer.writerow(["Registration no.", "Date of Birth", "Name", "Email", "Mobile"])

        for item in data:
            values = [item.get(column, "") for column in ["Registration no.", "Date of Birth", "Name", "Email", "Mobile"]]
            # Write data to CSV as a single row
            csv_writer.writerow(values)

# Function to generate input values within a range
def generate_input_values(start_value, end_value):
    return [str(i) for i in range(int(start_value), int(end_value) + 1)]

# Specify the path to the locally stored ChromeDriver executable
driver_path = 'chromedriver-win64/chromedriver.exe'  # Replace with the actual path

# Initialize the Chrome driver with the specified executable path
driver = webdriver.Chrome(executable_path=driver_path)

try:
    os.system('cls' if os.name == 'nt' else 'clear')
    start_value = input("Enter the start value: ")
    end_value = input("Enter the end value: ")

    input_values = generate_input_values(start_value, end_value)

    all_data = []  # To accumulate data for all input values

    for input_value in input_values:
        while True:  # Keep trying until valid data is found or a certain number of retries is reached
            # Navigate to the web page
            driver.get('https://exam.icab.org.bd/signup')

            # Find the registration number input field and send the input value
            registration_no_input = driver.find_element_by_css_selector('input[formcontrolname="registrationNo"]')
            registration_no_input.clear()
            registration_no_input.send_keys(input_value)
            registration_no_input.send_keys(Keys.RETURN)

            # Wait for the page to load (you may need to add appropriate waits)
            time.sleep(5)  # Adjust as needed

            # Check if "Record is not found in our system" message is displayed
            try:
                not_found_message = driver.find_element_by_css_selector('div.form-error-list')
                if "Record is not found in our system" in not_found_message.text:
                    print(f"Record not found for input value: {input_value}")
                    break  # Break out of the retry loop and move to the next input value
            except NoSuchElementException:
                # The message was not found, proceed with data extraction
                pass

            # Extract data from the page with Beautiful Soup
            page_source = driver.page_source
            soup = BeautifulSoup(page_source, 'html.parser')

            # Find and scrape data from the page based on labels
            data = {}

            # Find the div elements with class 'form-group'
            form_groups = soup.find_all('div', class_='form-group')

            for form_group in form_groups:
                div_text = form_group.text.strip()
                for column in ["Registration no.", "Date of Birth", "Name", "Email", "Mobile"]:
                    if column in div_text:
                        data[column] = div_text.replace(column, '').strip()

            # Append the data for this input value to the list
            all_data.append(data)
            break  # Break out of the retry loop as valid data was found

    # Process and save all accumulated data to a single CSV file
    save_data_to_csv(all_data, 'output.csv')

finally:
    # Close the web driver
    driver.quit()
