from selenium import webdriver
import time
from selenium.webdriver.common.by import By

class InternetSpeedBot:
    def __init__(self):
        self.driver = webdriver.Chrome()
        self.up = 0
        self.down = 0

    def get_speed(self):
        self.driver.get("https://www.speedtest.net")
        time.sleep(3)
        
        # Find the "Go" button by its class name
        go_btn = self.driver.find_element(By.CSS_SELECTOR, '.start-button a')
        go_btn.click()

# Rest of your code...

# Create an instance of the bot and call the get_speed method
bot = InternetSpeedBot()
bot.get_speed()
