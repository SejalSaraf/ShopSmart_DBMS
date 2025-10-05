from config.db import get_connection
from werkzeug.security import generate_password_hash

def hash_existing_passwords():
    conn = get_connection()
    cursor = conn.cursor()

    # ----- Hash User passwords -----
    cursor.execute("SELECT email, password FROM User")
    users = cursor.fetchall()

    for email, plain_password in users:
        # Skip already hashed passwords
        if plain_password.startswith("pbkdf2:sha256"):
            continue

        hashed_password = generate_password_hash(plain_password)
        cursor.execute(
            "UPDATE User SET password = %s WHERE email = %s",
            (hashed_password, email)
        )
        print(f"✅ Hashed User password for: {email}")

    # ----- Hash Admin passwords -----
    cursor.execute("SELECT email, password FROM Admin")
    admins = cursor.fetchall()

    for email, plain_password in admins:
        # Skip already hashed passwords
        if plain_password.startswith("pbkdf2:sha256"):
            continue

        hashed_password = generate_password_hash(plain_password)
        cursor.execute(
            "UPDATE Admin SET password = %s WHERE email = %s",
            (hashed_password, email)
        )
        print(f"✅ Hashed Admin password for: {email}")

    conn.commit()
    cursor.close()
    conn.close()
    print("All passwords hashed successfully!")

if __name__ == "__main__":
    hash_existing_passwords()
