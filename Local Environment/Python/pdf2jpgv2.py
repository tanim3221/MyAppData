import fitz  # PyMuPDF


def pdf_to_jpg(pdf_path, output_folder, resolution=700):
    pdf_document = fitz.open(pdf_path)
    for page_number in range(pdf_document.page_count):
        page = pdf_document[page_number]
        image = page.get_pixmap(matrix=fitz.Matrix(resolution / 72, resolution / 72))
        image_path = f"{output_folder}/page_{page_number + 1}.jpg"
        image.save(image_path)
    pdf_document.close()

if __name__ == "__main__":
    pdf_path = "source.pdf"
    output_folder = "output_folder"

    pdf_to_jpg(pdf_path, output_folder)
