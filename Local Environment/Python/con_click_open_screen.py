import time

import keyboard
import pyautogui


def click_at_interval(x, y, interval, clicks):
    for _ in range(clicks):
        pyautogui.click(x=x, y=y)
        time.sleep(interval)

# Define the grid parameters
grid_start_x = 475
grid_start_y = 310
grid_end_x = 1500
grid_end_y = 800
horizontal_click_gap = 60
vertical_click_gap = 40  # Adjust this value as needed

# Define the fixed coordinates (x, y) for the submit button
submit_button_x = 1621
submit_button_y = 882

# Set the time to wait before starting the process (in seconds)
initial_delay = 10

# Set the time interval between clicks (in seconds)
click_interval = 0.3

# Define the hotkey to stop the code (e.g., Ctrl + Shift + Q)
stop_hotkey = "ctrl+shift+q"

# Start recording keyboard events
keyboard.start_recording()

# Wait for the initial delay
print(f"Waiting for {initial_delay} seconds before starting...")
time.sleep(initial_delay)

try:
    while True:
        # Check for the stop hotkey press
        if keyboard.is_pressed(stop_hotkey):
            raise KeyboardInterrupt
        
        # Iterate through the grid and perform clicks
        for y in range(grid_start_y, grid_end_y, vertical_click_gap):
            for x in range(grid_start_x, grid_end_x, horizontal_click_gap):
                pyautogui.click(x=x, y=y)
                click_at_interval(submit_button_x, submit_button_y, click_interval, 1)

        # After reaching the bottom right, start again from the top left
        for y in range(grid_start_y, grid_end_y, vertical_click_gap):
            for x in range(grid_start_x, grid_end_x, horizontal_click_gap):
                pyautogui.click(x=x, y=y)
                click_at_interval(submit_button_x, submit_button_y, click_interval, 1)

except KeyboardInterrupt:
    print("Code execution stopped by user.")
finally:
    # Stop recording keyboard events
    keyboard.stop_recording()
