from datetime import datetime

import PyPDF2

curr_time = datetime.now().strftime("%Y%m%d%H%M%S")
def split_pdf(input_path, output_path, pages):
    pdf = PyPDF2.PdfReader(input_path)
    
    with open(output_path, "wb") as output_file:
        writer = PyPDF2.PdfWriter()
        
        for page_range in pages.split(','):
            if '-' in page_range:
                start, end = map(int, page_range.split('-'))
                for page_num in range(start - 1, end):
                    writer.add_page(pdf.pages[page_num])
            else:
                page_num = int(page_range) - 1
                writer.add_page(pdf.pages[page_num])
        
        writer.write(output_file)

input_pdf_path = input("\nEnter PDF file path: ")
output_pdf_path  = "Split_"+curr_time+".pdf"
pages_to_split = input("\nEnter page numbers or ranges (e.g., 1-3, 5, 7-9): ")

split_pdf(input_pdf_path, output_pdf_path, pages_to_split)
print(f"\nPDF pages split and saved to {output_pdf_path}")
