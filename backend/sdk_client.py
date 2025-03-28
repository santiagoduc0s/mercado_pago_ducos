import mercadopago
from config import load_config

config = load_config()
sdk = mercadopago.SDK(config["ACCESS_TOKEN_MERCADO_PAGO"])
