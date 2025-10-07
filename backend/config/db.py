import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_mysql_password",  # change this
        database="shopsmart_db",          # change if your DB name differs
        port=3306                         # default MySQL port
    )
