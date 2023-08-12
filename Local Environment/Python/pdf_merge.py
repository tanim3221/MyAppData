import os
from datetime import datetime

from PyPDF2 import PdfMerger

curr_time = datetime.now().strftime("%Y%m%d%H%M%S")
# Specify the directory containing the PDF files
pdf_directory = input("\n\nEnter the directory containing the PDF files:\n\n")
# Get a list of PDF files in the directory and sort them by filename
pdf_files = [pdf_file for pdf_file in os.listdir(pdf_directory) if pdf_file.endswith('.pdf')]
pdf_files.sort()
# Create a PdfMerger object
pdf_merger = PdfMerger()
# Iterate through sorted PDF files and append them to the merger
for pdf_file in pdf_files:
    pdf_path = os.path.join(pdf_directory, pdf_file)
    pdf_merger.append(pdf_path)
# Specify the output PDF file path
output_path  = pdf_directory + "/merged_"+curr_time+".pdf"
# Write the merged PDF to the output file
with open(output_path, 'wb') as output_file:
    pdf_merger.write(output_file)
print("PDFs merged successfully!")