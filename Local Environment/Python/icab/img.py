import os

import requests

# Range of numbers to generate
start_number = 5922
end_number = 37999  # Adjust this as needed

# Base URL for the images (assuming the number is part of the URL)
base_url = "https://s3.brilliant.com.bd/icab-exam/studentDocument/"

# Output folder for downloaded images
output_folder = "downloads"

def download_image(number):
    try:
        # Try different file extensions (jpeg, jpg, png)
        for extension in ["jpeg", "jpg", "png"]:
            # Construct the complete image URL
            image_url = f"{base_url}{number}/{number}.{extension}"

            # Send an HTTP GET request to the image URL
            response = requests.get(image_url)

            # Check if the request was successful (status code 200)
            if response.status_code == 200:
                # Create the output folder if it doesn't exist
                os.makedirs(output_folder, exist_ok=True)

                # Generate the file name based on the number
                file_name = os.path.join(output_folder, f"{number}.{extension}")

                # Save the image data to the specified file path
                with open(file_name, "wb") as f:
                    f.write(response.content)

                print(f"Image for number {number} downloaded and saved as {file_name}")
                break  # Exit the loop if the image is successfully downloaded
            else:
                print(f"Failed to download the image for number {number} with extension {extension}. Status code: {response.status_code}")

    except Exception as e:
        print(f"An error occurred while processing number {number}: {str(e)}")

# Download images for each number in the specified range
for number in range(start_number, end_number + 1):
    download_image(number)
