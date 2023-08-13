import os

from wand.image import Image

# Input PDF file path
input_pdf = input("\nEnter PDF file path: ")

# Get the input PDF file name without extension
pdf_name = os.path.splitext(os.path.basename(input_pdf))[0]

# Create the output folder with the same name as the PDF file
output_folder = os.path.join(os.path.dirname(input_pdf), pdf_name)
os.makedirs(output_folder, exist_ok=True)

# Convert PDF pages to JPG images using wand
with Image(filename=input_pdf, resolution=300) as pdf:
    for i, page in enumerate(pdf.sequence):
        with Image(page) as img:
            image_path = os.path.join(output_folder, f"{pdf_name}_page_{i + 1}.jpg")
            img.save(filename=image_path)

print("\nPDF pages converted to JPG images and saved in the output folder.")
