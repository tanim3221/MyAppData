from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Launch the browser
driver = webdriver.Chrome()

# Navigate to the URL
url = "https://exam.icab.org.bd/"
driver.get(url)

# Find the input fields and login button
password_input = driver.find_element(By.CSS_SELECTOR, '[formcontrolname="password"]')
registration_input = driver.find_element(By.CSS_SELECTOR, '[formcontrolname="registrationNo"]')
login_button = driver.find_element(By.XPATH, '//button[text()="Login"]')

# Input your credentials
password_input.send_keys("#Tanim1996")
registration_input.send_keys("33430")

# Click the login button
login_button.click()

# Wait for the page to load after login
WebDriverWait(driver, 10).until(EC.url_changes(url))

# Navigate to the API URL
api_url = "https://exam.icab.org.bd/api/v1/StudentMenu/get-all-student-menus"
driver.get(api_url)

# Retrieve the Authorization header
authorization_header = driver.execute_script("return window.performance.getEntries()[0].toJSON().requestHeaders.Authorization")

# Print the Authorization header
print(authorization_header)

# Close the browser
driver.quit()
