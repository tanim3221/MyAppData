import os
import re

def rename_files(src_path):
    try:
        files = os.listdir(src_path)
        # Regular expression to match files in the pattern "XX something.anything"
        pattern = re.compile(r'^(\d{1,2}) (.+\..+)$')
        
        for file_name in files:
            full_file_path = os.path.join(src_path, file_name)
            if os.path.isfile(full_file_path):
                # Try to match the pattern
                match = pattern.match(file_name)
                if match:
                    # Extract parts
                    leading_number, rest_of_file = match.groups()
                    # Format number with leading zeros
                    new_leading_number = f"{int(leading_number):03d}"
                    # Construct new filename
                    new_file_name = f"{new_leading_number} {rest_of_file}"
                    
                    # Rename the file
                    full_new_file_path = os.path.join(src_path, new_file_name)
                    os.rename(full_file_path, full_new_file_path)
                    print(f'Renamed file: {file_name} -> {new_file_name}')
                else:
                    print(f'Skipped {file_name}: Does not match pattern')
            else:
                print(f'Skipped {file_name}: Not a file')
        
        print('Renaming completed!')
    except FileNotFoundError:
        print(f'The specified directory {src_path} does not exist')
    except PermissionError:
        print('You do not have the necessary permissions to access the directory')
    except Exception as e:
        print(f'An error occurred: {str(e)}')

src_path = input("Enter the directory: ")

rename_files(src_path)
