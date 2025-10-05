from flask import request, jsonify
from models.userModel import UserModel

user_model = UserModel()

# Register a new user
def register_user():
    data = request.json
    success = user_model.create_user(
        data['name'], data['email'], data['password'], data['phone']
    )
    if success:
        return jsonify({"message": "User registered successfully"}), 201
    else:
        return jsonify({"message": "Error registering user"}), 400

# Login user
def login_user():
    data = request.json
    user = user_model.get_user_by_email(data['email'])
    if user and user_model.verify_password(data['password'], user['password']):
        return jsonify({"message": "Login successful", "user": user}), 200
    else:
        return jsonify({"message": "Invalid credentials"}), 401

# Get all users (for admin purposes)
def get_all_users():
    users = user_model.get_all_users()
    return jsonify(users), 200
