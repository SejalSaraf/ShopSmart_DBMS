from flask import request, jsonify
from models.productModel import ProductModel

product_model = ProductModel()

# Get all products
def get_products():
    category = request.args.get('category')
    if category:
        products = product_model.get_products_by_category(category)
    else:
        products = product_model.get_all_products()
    return jsonify(products), 200

# Get single product by id
def get_product(product_id):
    product = product_model.get_product_by_id(product_id)
    if product:
        return jsonify(product), 200
    else:
        return jsonify({"message": "Product not found"}), 404

# Add new product
def add_product():
    data = request.json
    success = product_model.create_product(
        data['name'], data['category'], data['price'], data['stock']
    )
    if success:
        return jsonify({"message": "Product added successfully"}), 201
    else:
        return jsonify({"message": "Error adding product"}), 400
