import csv
import time

from bs4 import BeautifulSoup
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


# Function to save data to a CSV file
def save_data_to_csv(data, filename):
    with open(filename, 'w', newline='') as csvfile:
        csv_writer = csv.writer(csvfile)
        # Write header row
        csv_writer.writerow(['Label', 'Value'])  # Customize column names as needed

        for item in data:
            label = item[0]
            value = item[1]

            # Write data to CSV
            csv_writer.writerow([label, value])

# Specify the path to the locally stored ChromeDriver executable
driver_path = 'chromedriver-win64/chromedriver.exe'  # Replace with the actual path

# Initialize the Chrome driver with the specified executable path
driver = webdriver.Chrome(executable_path=driver_path)

try:
    with open('reg.txt', 'r') as input_file:
        input_values = [line.strip() for line in input_file]

    all_data = []  # To accumulate data for all input values

    for input_value in input_values:
        # Navigate to the web page
        driver.get('https://exam.icab.org.bd/signup')

        # Find the registration number input field and send the input value
        registration_no_input = driver.find_element_by_css_selector('input[formcontrolname="registrationNo"]')
        registration_no_input.clear()
        registration_no_input.send_keys(input_value)
        registration_no_input.send_keys(Keys.RETURN)

        # Wait for the page to load (you may need to add appropriate waits)
        time.sleep(5)  # Adjust as needed

        # Extract data from the page with Beautiful Soup
        page_source = driver.page_source
        soup = BeautifulSoup(page_source, 'html.parser')

        # Find and scrape data from the page based on labels
        labels_to_extract = ["Registration no.", "Date of Birth", "Name", "Email", "Mobile"]
        data = []

        # Find the div elements with class 'form-group'
        form_groups = soup.find_all('div', class_='form-group')

        for form_group in form_groups:
            div_text = form_group.text.strip()
            for label in labels_to_extract:
                if label in div_text:
                    data.append((label, div_text.replace(label, '').strip()))

        # Accumulate the data for this input value
        all_data.extend(data)

    # Process and save all accumulated data to a single CSV file
    save_data_to_csv(all_data, 'output.csv')

finally:
    # Close the web driver
    driver.quit()
