import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from config.db import get_connection

from werkzeug.security import generate_password_hash, check_password_hash

class AdminModel:
    def __init__(self):
        self.conn = get_connection()
        self.conn.autocommit = True

    def create_admin(self, name, email, password):
        hashed = generate_password_hash(password)
        cursor = self.conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO Admin (name, email, password) VALUES (%s, %s, %s)",
                (name, email, hashed)
            )
            return True
        except:
            return False
        finally:
            cursor.close()

    def get_admin_by_email(self, email):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Admin WHERE email = %s", (email,))
        admin = cursor.fetchone()
        cursor.close()
        return admin
    
    def verify_password(self, password, hashed):
        return check_password_hash(hashed, password)
