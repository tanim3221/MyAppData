import os
from datetime import datetime

from PIL import Image
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen import canvas

curr_time = datetime.now().strftime("%Y%m%d%H%M%S")

# Input folder containing image files (JPG, PNG, etc.)
input_folder = input("\nEnter image folder directory: ")

# Get a list of image file paths from the input folder
image_paths = [os.path.join(input_folder, file) for file in os.listdir(input_folder) if file.lower().endswith(('.jpg', '.png', '.jpeg', '.gif', '.bmp'))]

# Output PDF file name based on the input folder name
pdf_output = os.path.join(input_folder, f"{os.path.basename(input_folder)}_"+curr_time+".pdf")

# Create a PDF using ReportLab
c = canvas.Canvas(pdf_output, pagesize=letter)

for image_path in image_paths:
    image = Image.open(image_path)
    image_width, image_height = image.size

    if image_width < A4[0] and image_height < A4[1]:
        page_size = A4  # Set to A4 if smaller than A4
    else:
        page_size = (image_width, image_height)

    c.setPageSize(page_size)
    c.drawImage(image_path, 0, 0, width=image_width, height=image_height, preserveAspectRatio=True, anchor='nw')
    c.showPage()

c.save()

print(f"\nPDF created and save to : {pdf_output}")
