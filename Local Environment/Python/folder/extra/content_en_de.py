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
    key = input("Enter a passphrase for encryption: ").encode()
    kdf = hashes.Hash(hashes.SHA256(), backend=default_backend())
    kdf.update(key)
    return kdf.finalize()

def encrypt_string(input_string, key):
    backend = default_backend()
    iv = os.urandom(16)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=backend)
    encryptor = cipher.encryptor()
    padder = padding.PKCS7(128).padder()
    padded_data = padder.update(input_string) + padder.finalize()
    encrypted_data = encryptor.update(padded_data) + encryptor.finalize()
    return base64.b64encode(iv + encrypted_data).decode()

def decrypt_string(input_string, key):
    backend = default_backend()
    decoded_data = base64.b64decode(input_string)
    iv, encrypted_data = decoded_data[:16], decoded_data[16:]
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=backend)
    decryptor = cipher.decryptor()
    decrypted_data = decryptor.update(encrypted_data) + decryptor.finalize()
    unpadder = padding.PKCS7(128).unpadder()
    return unpadder.update(decrypted_data) + unpadder.finalize()

def process_directory(path, key, decrypt=False):
    for root, _, files in os.walk(path):
        for name in files:
            full_name = os.path.join(root, name)
            try:
                with open(full_name, 'rb') as f:
                    data = f.read()
                if decrypt:
                    decrypted_data = decrypt_string(data, key)
                    with open(full_name, 'wb') as f:
                        f.write(decrypted_data)
                else:
                    encrypted_data = encrypt_string(data, key)
                    with open(full_name, 'wb') as f:
                        f.write(encrypted_data.encode())
            except Exception as e:
                print(f"Failed to process {full_name} due to: {str(e)}")

def save_passphrase(key):
    with open(PASSPHRASE_FILE, 'w') as f:
        f.write(base64.b64encode(key).decode())

def load_passphrase():
    with open(PASSPHRASE_FILE, 'r') as f:
        return base64.b64decode(f.read())

def log_operation(operation, path):
    with open(LOG_FILE, 'a') as f:
        f.write(f"{operation} performed on {path} at {datetime.datetime.now()}\n")

def main():
    main_folder = input("Enter the path of the main folder to encrypt/decrypt: ")
    action = input("Choose an action [en/de]: ").strip().lower()

    if action == "en":
        key = get_encryption_key()
        save_passphrase(key)  # Store passphrase
        process_directory(main_folder, key)
        log_operation("Encryption", main_folder)
    elif action == "de":
        key = load_passphrase()  # Retrieve passphrase
        process_directory(main_folder, key, decrypt=True)
        log_operation("Decryption", main_folder)
    else:
        print("Invalid action!")

if __name__ == "__main__":
    main()