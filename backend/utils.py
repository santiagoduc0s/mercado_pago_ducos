import json
import hmac
import hashlib

def log_data(data, title='LOG'):
    """Logs the given data with a title in a formatted JSON style."""
    print(f"--- {title} ---")
    try:
        formatted = json.dumps(data, indent=4, ensure_ascii=False)
        print(formatted)
    except (TypeError, ValueError):
        print(data)

def validate_signature(xSignature, xRequestId, dataID, secret):
    """
    Validates the HMAC signature received in the x-signature header.
    Returns True if the signature is valid, False otherwise.
    """
    # Parse the x-signature header to extract ts and v1 values
    parts = xSignature.split(",")
    ts = None
    v1 = None
    for part in parts:
        key_value = part.split("=", 1)
        if len(key_value) == 2:
            key, value = key_value[0].strip(), key_value[1].strip()
            if key == "ts":
                ts = value
            elif key == "v1":
                v1 = value

    if not ts or not v1:
        return False

    # Create the manifest string (note the semicolons)
    manifest = f"id:{dataID};request-id:{xRequestId};ts:{ts};"
    
    # Compute the HMAC using SHA256
    hmac_obj = hmac.new(secret.encode(), msg=manifest.encode(), digestmod=hashlib.sha256)
    computed_signature = hmac_obj.hexdigest()

    return computed_signature == v1
