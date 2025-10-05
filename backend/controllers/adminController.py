from flask import request, jsonify
from models.adminModel import AdminModel

admin_model = AdminModel()

# Register admin
def register_admin():
    data = request.json
    success = admin_model.create_admin(
        data['name'], data['email'], data['password']
    )
    if success:
        return jsonify({"message": "Admin registered successfully"}), 201
    else:
        return jsonify({"message": "Error registering admin"}), 400

# Login admin
def login_admin():
    data = request.json
    admin = admin_model.get_admin_by_email(data['email'])
    if admin and admin_model.verify_password(data['password'], admin['password']):
        return jsonify({"message": "Login successful", "admin": admin}), 200
    else:
        return jsonify({"message": "Invalid credentials"}), 401
