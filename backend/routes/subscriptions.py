from flask import Blueprint, request
from sdk_client import sdk

subscriptions_bp = Blueprint('subscriptions', __name__, url_prefix='/subscriptions')

@subscriptions_bp.route("/create-subscription", methods=["POST"])
def create_subscription():
    data = request.json or {}
    response = sdk.preapproval().create(data)
    return response["response"], response["status"]
