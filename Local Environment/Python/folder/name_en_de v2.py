import base64
import datetime
import json
import os

from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

LOG_FILE = "log.txt"
PASSPHRASE_FILE = "passphrase.txt"

# Check for LOG_FILE
if not os.path.exists(LOG_FILE):
    with open(LOG_FILE, 'w') as f:
        f.write('')  # Creating an empty file

# Check for PASSPHRASE_FILE
if not os.path.exists(PASSPHRASE_FILE):
    with open(PASSPHRASE_FILE, 'w') as f:
        f.write('')  # Creating an empty file


def get_encryption_key():
    # Derive the encryption key from the user input using SHA-256.
    passphrase = input("Enter a passphrase for encryption: ")
    digest = hashes.Hash(hashes.SHA256(), backend=default_backend())
    digest.update(passphrase.encode())
    return digest.finalize()

def initialize_passphrase_file():
    """Initialize the PASSPHRASE_FILE with an empty dictionary if it doesn't exist or if it's empty."""
    if not os.path.exists(PASSPHRASE_FILE) or os.stat(PASSPHRASE_FILE).st_size == 0:
        with open(PASSPHRASE_FILE, 'w') as f:
            json.dump({}, f)

def save_passphrase(directory, key):
    initialize_passphrase_file()  # Ensure the passphrase file is properly initialized.

    with open(PASSPHRASE_FILE, 'r') as f:
        data = json.load(f)

    # Save the directory and key in base64 format.
    data[directory] = base64.b64encode(key).decode()

    # Write the updated dictionary back to the file.
    with open(PASSPHRASE_FILE, 'w') as f:
        json.dump(data, f)


def load_passphrase(directory):
    initialize_passphrase_file()  # Ensure the passphrase file is properly initialized.

    with open(PASSPHRASE_FILE, 'r') as f:
        data = json.load(f)

    # Start with the full path and keep truncating until you find a match or reach the root
    current_dir = directory
    while current_dir:
        if current_dir in data:
            return base64.b64decode(data[current_dir])
        current_dir = os.path.dirname(current_dir)

    raise ValueError(f"No stored passphrase for directory: {directory} or its parents.")



def main():
    main_folder = input("Enter the path of the main folder to encrypt/decrypt: ")
    action = input("Choose an action [en/de]: ").strip().lower()

    try:
        if action == "en":
            key = get_encryption_key()
            save_passphrase(main_folder, key)  # Store the passphrase with directory association.
            file_count, folder_count, total_size, details = process_directory(main_folder, key)
            log_operation("Encryption", main_folder, file_count, folder_count, total_size, details)
        elif action == "de":
            key = load_passphrase(main_folder)  # Load the passphrase associated with the directory.
            file_count, folder_count, total_size, details = process_directory(main_folder, key, decrypt=True)
            log_operation("Decryption", main_folder, file_count, folder_count, total_size, details)
        else:
            print("Invalid action!")
    except Exception as e:
        print(f"An error occurred: {e}")



def encrypt_string(input_string, key):
    backend = default_backend()
    iv = os.urandom(16)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=backend)
    encryptor = cipher.encryptor()
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(input_string) + padder.finalize()
    encrypted_data = encryptor.update(padded_data) + encryptor.finalize()
    return base64.urlsafe_b64encode(iv + encrypted_data).decode()  # urlsafe version

def decrypt_string(input_string, key):
    backend = default_backend()
    decoded_data = base64.urlsafe_b64decode(input_string)
    iv, encrypted_data = decoded_data[:16], decoded_data[16:]
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=backend)
    decryptor = cipher.decryptor()
    decrypted_data = decryptor.update(encrypted_data) + decryptor.finalize()
    unpadder = padding.PKCS7(128).unpadder()
    unpadded_data = unpadder.update(decrypted_data) + unpadder.finalize()
    return unpadded_data.decode('utf-8')  # convert bytes to string


def log_operation(operation, path, file_count=0, folder_count=0, total_size=0, details=None):
    with open(LOG_FILE, 'a') as f:
        f.write(f"{operation} performed on {path} at {datetime.datetime.now()}\n")
        f.write(f"Files processed: {file_count}\n")
        f.write(f"Directories processed: {folder_count}\n")
        f.write(f"Total data size: {total_size} bytes\n")
        if details:
            f.write("--- Details ---\n")
            f.write(details)
            f.write("\n----------------\n\n")


def process_directory(path, key, decrypt=False):
    file_count = 0
    folder_count = 0
    total_size = 0
    details = []

    for root, dirs, files in os.walk(path, topdown=False):  # topdown=False for depth-first
        for name in files:
            full_name = os.path.join(root, name)
            new_name = decrypt_string(name, key) if decrypt else encrypt_string(name.encode(), key)
            os.rename(full_name, os.path.join(root, new_name))
            file_size = os.path.getsize(os.path.join(root, new_name))
            total_size += file_size
            file_count += 1
            details.append(f"File: {full_name} ({file_size} bytes)")

        for name in dirs:
            full_name = os.path.join(root, name)
            new_name = decrypt_string(name, key) if decrypt else encrypt_string(name.encode(), key)
            os.rename(full_name, os.path.join(root, new_name))
            folder_count += 1
            details.append(f"Directory: {full_name}")

    return file_count, folder_count, total_size, "\n".join(details)

if __name__ == "__main__":
    os.system('cls' if os.name == 'nt' else 'clear')
    main()