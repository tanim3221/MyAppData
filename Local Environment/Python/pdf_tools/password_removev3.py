import os
import PyPDF2

def decrypt_pdf(input_path):
    with open(input_path, 'rb') as file:
        reader = PyPDF2.PdfReader(file)

        if reader.is_encrypted:
            if reader.decrypt(''):  # Provide an empty string as the password
                writer = PyPDF2.PdfWriter()

                for i in range(len(reader.pages)):
                    writer.add_page(reader.pages[i])

                # Derive new output path
                base, ext = os.path.splitext(input_path)
                output_path = f"{base}_decrypted{ext}"

                with open(output_path, 'wb') as output_file:
                    writer.write(output_file)

                print(f"Password removed and saved to {output_path}")
            else:
                print("Unable to remove password. Password may be required.")
        else:
            print("PDF is not encrypted.")

input_path = input("Enter the PDF file path: ")
decrypt_pdf(input_path)
