from flask import Blueprint
from controllers.userController import register_user, login_user, get_all_users

user_bp = Blueprint('user_bp', __name__)

# Register a new user
user_bp.route('/register', methods=['POST'])(register_user)

# Login user
user_bp.route('/login', methods=['POST'])(login_user)

# Get all users (admin only)
user_bp.route('/all', methods=['GET'])(get_all_users)
