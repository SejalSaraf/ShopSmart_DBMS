import mysql.connector

def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="Komal@2005",   # Your MySQL password
        database="onlineShoppingdb"
    )
