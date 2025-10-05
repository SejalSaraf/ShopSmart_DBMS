from config.db import get_connection

class OrderModel:
    def __init__(self):
        self.conn = get_connection()
        self.conn.autocommit = True

    def create_order(self, user_id, total_amount, status="Pending"):
        cursor = self.conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO `Order` (user_id, total_amount, status) VALUES (%s, %s, %s)",
                (user_id, total_amount, status)
            )
            order_id = cursor.lastrowid
            return order_id
        except:
            return None
        finally:
            cursor.close()

    def add_order_item(self, order_id, product_id, quantity, price):
        cursor = self.conn.cursor()
        try:
            cursor.execute(
                "INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (%s, %s, %s, %s)",
                (order_id, product_id, quantity, price)
            )
            return True
        except:
            return False
        finally:
            cursor.close()

    def get_orders_by_user(self, user_id):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM `Order` WHERE user_id = %s", (user_id,))
        orders = cursor.fetchall()
        cursor.close()
        return orders

    def get_order_details(self, order_id):
        cursor = self.conn.cursor(dictionary=True)
        cursor.execute("""
            SELECT o.order_id, o.total_amount, o.status, oi.product_id, oi.quantity, oi.price
            FROM `Order` o
            JOIN OrderItem oi ON o.order_id = oi.order_id
            WHERE o.order_id = %s
        """, (order_id,))
        items = cursor.fetchall()
        cursor.close()
        return items
