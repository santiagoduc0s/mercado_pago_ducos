from flask import Blueprint, request
from sdk_client import sdk

preferences_bp = Blueprint('preferences', __name__, url_prefix='/preferences')

@preferences_bp.route("/create-preference", methods=["POST"])
def create_preference():
    data = request.json or {}
    response = sdk.preference().create(data)
    return response["response"], response["status"]

@preferences_bp.route("/search-preferences", methods=["GET"])
def search_preferences():
    data = request.json or {}
    response = sdk.preference().search(data)
    return response["response"], response["status"]
