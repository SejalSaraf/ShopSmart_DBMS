from config.db import get_connection

class ProductModel:
    def __init__(self):
        self.conn = get_connection()
        self.conn.autocommit = True

    def get_all_products(self):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Product")
        products = cursor.fetchall()
        cursor.close()
        return products

    def get_products_by_category(self, category):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Product WHERE category = %s", (category,))
        products = cursor.fetchall()
        cursor.close()
        return products

    def get_product_by_id(self, product_id):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Product WHERE product_id = %s", (product_id,))
        product = cursor.fetchone()
        cursor.close()
        return product

    def create_product(self, name, category, price, stock):
        cursor = self.conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO Product (name, category, price, stock) VALUES (%s, %s, %s, %s)",
                (name, category, price, stock)
            )
            return True
        except:
            return False
        finally:
            cursor.close()
