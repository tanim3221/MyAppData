import tkinter as tk
from tkinter import messagebox, ttk

import mysql.connector
from ttkthemes import ThemedStyle


class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Advanced GUI with MySQL Example")
        
        self.db_connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="python"
        )
        
        self.login_frame = LoginFrame(self, self.db_connection)
        self.registration_frame = RegistrationFrame(self, self.db_connection)
        self.home_frame = HomeFrame(self)
        
        self.login_frame.pack()
    
    def switch_frames(self, to_frame):
        self.login_frame.pack_forget()
        self.registration_frame.pack_forget()
        self.home_frame.pack_forget()
        
        if to_frame == "login":
            self.login_frame.pack()
        elif to_frame == "registration":
            self.registration_frame.pack()
        elif to_frame == "home":
            self.home_frame.pack()

class LoginFrame(tk.Frame):
    def __init__(self, master, db_connection):
        super().__init__(master)
        self.db_connection = db_connection
        
        self.username_label = tk.Label(self, text="Username:")
        self.username_entry = tk.Entry(self)
        
        self.password_label = tk.Label(self, text="Password:")
        self.password_entry = tk.Entry(self, show="*")
        
        self.login_button = tk.Button(self, text="Login", command=self.login)
        self.register_button = tk.Button(self, text="Register", command=self.register)
        
        self.username_label.pack(pady=10)
        self.username_entry.pack(pady=5)
        
        self.password_label.pack()
        self.password_entry.pack(pady=5)
        
        self.login_button.pack(pady=5)
        self.register_button.pack()
        
    def login(self):
        username = self.username_entry.get()
        password = self.password_entry.get()
        
        cursor = self.db_connection.cursor()
        query = "SELECT * FROM users WHERE username = %s AND password = %s"
        cursor.execute(query, (username, password))
        
        user = cursor.fetchone()
        cursor.close()
        
        if user:
            self.master.switch_frames("home")
        else:
            messagebox.showerror("Error", "Invalid credentials")

    def register(self):
        self.master.switch_frames("registration")

class RegistrationFrame(tk.Frame):
    def __init__(self, master, db_connection):
        super().__init__(master)
        self.db_connection = db_connection
        
        self.username_label = tk.Label(self, text="Username:")
        self.username_entry = tk.Entry(self)
        
        self.password_label = tk.Label(self, text="Password:")
        self.password_entry = tk.Entry(self, show="*")
        
        self.register_button = tk.Button(self, text="Register", command=self.register)
        
        self.username_label.pack(pady=10)
        self.username_entry.pack(pady=5)
        
        self.password_label.pack()
        self.password_entry.pack(pady=5)
        
        self.register_button.pack(pady=10)
        
    def register(self):
        username = self.username_entry.get()
        password = self.password_entry.get()
        
        cursor = self.db_connection.cursor()
        query = "INSERT INTO users (username, password) VALUES (%s, %s)"
        cursor.execute(query, (username, password))
        self.db_connection.commit()
        
        messagebox.showinfo("Success", "Registration successful!")
        self.master.switch_frames("login")

class HomeFrame(tk.Frame):
    def __init__(self, master):
        super().__init__(master)
        
        self.welcome_label = tk.Label(self, text="Welcome to the Home Page!")
        self.logout_button = tk.Button(self, text="Logout", command=self.logout)
        
        self.welcome_label.pack(pady=10)
        self.logout_button.pack(pady=5)
        
    def logout(self):
        self.master.switch_frames("login")

def main():
    app = Application()
    app.mainloop()

if __name__ == "__main__":
    main()
