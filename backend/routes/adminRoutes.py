from flask import Blueprint
from controllers.adminController import register_admin, login_admin

admin_bp = Blueprint('admin_bp', __name__)


# Register a new admin
admin_bp.route('/register', methods=['POST'])(register_admin)

# Login admin
admin_bp.route('/login', methods=['POST'])(login_admin)
