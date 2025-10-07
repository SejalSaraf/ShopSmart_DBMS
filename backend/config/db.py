import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="strawberryshortcake",   # Your MySQL password
        database="OnlineShoppingDB"
    )
