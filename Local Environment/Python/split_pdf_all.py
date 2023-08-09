import os
import PyPDF2
from datetime import datetime

curr_time = datetime.now().strftime("%Y%m%d%H%M%S")

def split_pdf_individual(input_path):
    pdf = PyPDF2.PdfReader(input_path)
    input_filename = os.path.basename(input_path)
    output_folder = os.path.splitext(input_filename)[0]  # Use the PDF file name without extension

    os.makedirs(output_folder, exist_ok=True)

    for page_num, page in enumerate(pdf.pages, start=1):
        output_path = os.path.join(output_folder, f"page_{page_num}.pdf")
        writer = PyPDF2.PdfWriter()
        writer.add_page(page)
        with open(output_path, "wb") as output_file:
            writer.write(output_file)
    
    return output_folder  # Return the output folder path

input_pdf_path = input("\n\nEnter PDF file path: ")
output_folder = split_pdf_individual(input_pdf_path)
print(f"PDF pages split and saved individually in folder: {output_folder}")
