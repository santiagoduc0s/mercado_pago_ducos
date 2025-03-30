from flask import Blueprint, request
from config import load_config
from sdk_client import sdk
from utils import log_data, validate_signature

events_bp = Blueprint('events', __name__)

config = load_config()

@events_bp.route("/events", methods=["POST"])
def events():
    xSignature = request.headers.get("x-signature", "")
    xRequestId = request.headers.get("x-request-id", "")
    dataID = request.args.get("data.id", "")
    secret = config["SECRET_KEY_MERCADO_PAGO"]

    if not validate_signature(xSignature, xRequestId, dataID, secret):
        return {'message': 'Signature verification failed'}, 400

    data = request.json or {}
    log_data(data, 'data')

    type_transaction = request.args.get("type", "")
    log_data(type_transaction, 'type_transaction')

    action = data.get("action")

    # Subscriptions
    if type_transaction == "subscription_preapproval":
        payment_id = data["data"]["id"]
        preapproval = sdk.preapproval().get(payment_id)
        log_data(preapproval, 'preapproval')

        if preapproval['status'] == "authorized":
            external_reference = payment_data.get("external_reference", "")
            log_data(external_reference, 'external_reference')
            return {'message': 'Subscription approved!'}

        if preapproval['status'] == "cancelled":
            return {'message': 'Subscription cancelled!'}

    # Preferences
    if type_transaction == "payment":
        payment_id = data["data"]["id"]
        log_data(payment_id, 'payment_id')

        payment = sdk.payment().get(payment_id)
        payment_data = payment["response"]
        status = payment_data["status"]
        
        if status == "approved":
            metadata = payment_data.get("metadata", {})
            order_id = metadata.get("order_id", "")
            log_data(order_id, 'order_id')

            external_reference = payment_data.get("external_reference", "")
            log_data(external_reference, 'external_reference')

            return {'message': 'Payment approved!'}

    return {'message': 'OK'}
