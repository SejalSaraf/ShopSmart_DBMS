import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="strawberryshortcake",  # change this
        database="online_shoppingdb",          # change if your DB name differs
        port=3306                         # default MySQL port
    )
