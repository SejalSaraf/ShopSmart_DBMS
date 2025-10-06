from flask import Blueprint
from controllers.productController import get_products, get_product, add_product

product_bp = Blueprint('product_bp', __name__)

# Get all products or by category
product_bp.route('/', methods=['GET'])(get_products)

# Get product by ID
product_bp.route('/<int:product_id>', methods=['GET'])(get_product)

# Add a new product
product_bp.route('/add', methods=['POST'])(add_product)
