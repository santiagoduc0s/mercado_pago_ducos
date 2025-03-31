from flask import Blueprint, request
from sdk_client import sdk

plans_bp = Blueprint('plans', __name__, url_prefix='/plans')

@plans_bp.route("/search-plans", methods=["GET"])
def create_subscription():
    data = request.json or {}
    response = sdk.plan().search(data)
    return response["response"], response["status"]
