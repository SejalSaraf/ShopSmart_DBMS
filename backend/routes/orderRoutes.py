from flask import Blueprint
from controllers.orderController import create_order, get_user_orders, get_order_details

order_bp = Blueprint('order_bp', __name__)

# Create a new order
order_bp.route('/create', methods=['POST'])(create_order)

# Get all orders for a specific user
order_bp.route('/user/<int:user_id>', methods=['GET'])(get_user_orders)

# Get order details by order ID
order_bp.route('/<int:order_id>', methods=['GET'])(get_order_details)
