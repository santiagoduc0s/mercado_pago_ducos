from flask import Blueprint, request
from sdk_client import sdk

subscriptions_bp = Blueprint('subscriptions', __name__, url_prefix='/subscriptions')

@subscriptions_bp.route("/create-subscription", methods=["POST"])
def create_subscription():
    data = request.json or {}
    response = sdk.preapproval().create(data)
    return response["response"], response["status"]

@subscriptions_bp.route("/search-subscriptions", methods=["GET"])
def search_subscriptions():
    data = request.json or {}
    response = sdk.preapproval().search(data)
    return response["response"], response["status"]

@subscriptions_bp.route("/get-subscription", methods=["GET"])
def get_subscription():
    data = request.json or {}
    response = sdk.preapproval().get(data["id"])
    return response["response"], response["status"]
