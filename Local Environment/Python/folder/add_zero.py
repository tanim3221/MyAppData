import os

def rename_files(src_path):
    try:
        files = os.listdir(src_path)
        for file_name in files:
            full_file_path = os.path.join(src_path, file_name)
            if os.path.isfile(full_file_path):
                # Extract the leading number from the filename
                try:
                    leading_number = int(file_name.split(' ')[0])
                except ValueError:
                    print(f'Skipped {file_name}: Not a valid format')
                    continue
                
                # Format the leading number to be at least 3 digits
                new_leading_number = f"{leading_number:03d}"
                
                # Debug print
                print(f"Debug: {leading_number} -> {new_leading_number}")
                
                # Replace the original leading number with the new one
                new_file_name = file_name.replace(str(leading_number), new_leading_number, 1)
                
                # Rename the file
                full_new_file_path = os.path.join(src_path, new_file_name)
                os.rename(full_file_path, full_new_file_path)
                print(f'Renamed file: {file_name} -> {new_file_name}')
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
