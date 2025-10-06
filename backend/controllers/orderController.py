from flask import request, jsonify
from models.orderModel import OrderModel

order_model = OrderModel()

# Create new order
def create_order():
    data = request.json
    order_id = order_model.create_order(data['user_id'], data['total_amount'])
    if not order_id:
        return jsonify({"message": "Error creating order"}), 400

    # Add order items
    for item in data['items']:
        order_model.add_order_item(order_id, item['product_id'], item['quantity'], item['price'])
    return jsonify({"message": "Order created successfully", "order_id": order_id}), 201

# Get orders for a user
def get_user_orders(user_id):
    orders = order_model.get_orders_by_user(user_id)
    return jsonify(orders), 200

# Get order details
def get_order_details(order_id):
    items = order_model.get_order_details(order_id)
    if items:
        return jsonify(items), 200
    else:
        return jsonify({"message": "Order not found"}), 404
