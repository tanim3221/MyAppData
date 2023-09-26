import base64
import datetime
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

def save_passphrase(key):
    # Save the key in base64 format.
    with open(PASSPHRASE_FILE, 'w') as f:
        f.write(base64.b64encode(key).decode())

def load_passphrase():
    # Load the key and decode it from base64.
    with open(PASSPHRASE_FILE, 'r') as f:
        stored_passphrase = f.read().strip()
        if not stored_passphrase:
            raise ValueError("Stored passphrase is empty. Cannot decrypt.")
        return base64.b64decode(stored_passphrase)

def main():
    main_folder = input("Enter the path of the main folder to encrypt/decrypt: ")
    action = input("Choose an action [en/de]: ").strip().lower()

    try:
        if action == "en":
            key = get_encryption_key()
            save_passphrase(key)  # Store the passphrase after getting it.
            process_directory(main_folder, key)
            log_operation("Encryption", main_folder)
        elif action == "de":
            key = load_passphrase()  # Load the passphrase before using it.
            process_directory(main_folder, key, decrypt=True)
            log_operation("Decryption", main_folder)
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

def process_directory(path, key, decrypt=False):
    for root, dirs, files in os.walk(path, topdown=False):  # topdown=False for depth-first
        for name in files:
            full_name = os.path.join(root, name)
            new_name = decrypt_string(name, key) if decrypt else encrypt_string(name.encode(), key)
            os.rename(full_name, os.path.join(root, new_name))

        for name in dirs:
            full_name = os.path.join(root, name)
            new_name = decrypt_string(name, key) if decrypt else encrypt_string(name.encode(), key)
            os.rename(full_name, os.path.join(root, new_name))


def log_operation(operation, path):
    with open(LOG_FILE, 'a') as f:
        f.write(f"{operation} performed on {path} at {datetime.datetime.now()}\n")

if __name__ == "__main__":
    os.system('cls' if os.name == 'nt' else 'clear')
    main()