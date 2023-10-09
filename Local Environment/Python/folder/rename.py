import os

def rename_files(src_path, keyword_to_replace, replacement):
    try:
        files = os.listdir(src_path)
        for file_name in files:
            full_file_path = os.path.join(src_path, file_name)
            if os.path.isfile(full_file_path):
                # Replace the specific keyword in the file name
                new_file_name = file_name.replace(keyword_to_replace, replacement)
                
                # If the new name is different, rename the file
                if new_file_name != file_name:
                    full_new_file_path = os.path.join(src_path, new_file_name)
                    os.rename(full_file_path, full_new_file_path)
                    print(f'Renamed file: {file_name} -> {new_file_name}')
                else:
                    print(f'Skipped {file_name}: No replacement needed')
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
keyword_to_replace = input("Enter the old keywords: ")
replacement = input("Enter the new keywords: ")

rename_files(src_path, keyword_to_replace, replacement)
