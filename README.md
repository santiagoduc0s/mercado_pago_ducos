# Mercado Pago Ducos

Reference SDK: [Mercado Pago Developers](https://www.mercadopago.com.ar/developers/en/reference)

This package provides a server-side implementation of the Mercado Pago API. It leverages your backend to consume the services. Complete examples are available in both the backend and example folders.

### Available Services

* Preferences
	* createPreference()
	* searchPreferences()
	* getPreference()
	* updatePreference()
* Subscriptions
	* createSubscription()
	* searchSubscriptions()
	* getSubscription()
	* updateSubscription()

## Example Usage

Below is a complete example demonstrating how to use every service provided by the package. This example uses Dio for HTTP requests, url_launcher to open URLs, and Flutter for the UI.

```dart
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mercado_pago_ducos/mercado_pago_ducos.dart';
import 'package:url_launcher/url_launcher.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MercadoPago mercadoPago;

  @override
  void initState() {
    super.initState();

    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrlBackend,
      ),
    );

    final provider = DioHttpProvider(
      dio: dio,
    );

    final client = HttpClient(provider: provider);

    mercadoPago = MercadoPago(client: client);
  }

  Future<void> createPreference() async {
    final response = await mercadoPago.createPreference(
      body: CreatePreferenceRequestBody(
        items: [
          Item(
            id: '1234',
            title: 'Test',
            quantity: 1,
            unitPrice: 20,
          ),
        ],
        externalReference: 'or-1234',
        metadata: {
          'order_id': 'or-1234',
        },
      ),
    );

    launchUrl(
      Uri.parse(response.initPoint),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> searchPreferences() async {
    final response = await mercadoPago.searchPreferences(
      body: SearchPreferencesRequestBody(),
    );

    log(response.total.toString());
  }

  Future<void> getPreference() async {
    final response = await mercadoPago.getPreference(
      body: GetPreferenceRequestBody(
        id: "2347358770-4398e34b-c80c-4d26-8156-3a0b1d4e7e3e",
      ),
    );

    log(response.id);
  }

  Future<void> updatePreference() async {
    final response = await mercadoPago.updatePreference(
      body: UpdatePreferenceRequestBody(
        id: "2347358770-4398e34b-c80c-4d26-8156-3a0b1d4e7e3e",
        externalReference: 'or-1234-update',
      ),
    );

    log(response.id);
  }

  Future<void> createSubscription() async {
    final response = await mercadoPago.createSubscription(
      body: CreateSubscriptionRequestBody(
        reason: 'Subscription without associated plan',
        autoRecurring: AutoRecurring(
          frequency: 1,
          frequencyType: 'months',
          transactionAmount: 20.5,
          currencyId: 'UYU',
        ),
        payerEmail: 'test_user_1747582417@testuser.com',
        externalReference: 'or-1234',
        backUrl: 'https://www.google.com',
      ),
    );

    launchUrl(
      Uri.parse(response.initPoint),
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> searchSubscriptions() async {
    final response = await mercadoPago.searchSubscriptions(
      body: SearchSubscriptionsRequestBody(
        // offset: 50,
        limit: 50,
      ),
    );

    log(response.results.length.toString());
  }

  Future<void> getSubscription() async {
    final response = await mercadoPago.getSubscription(
      body: GetSubscriptionRequestBody(
        id: 'edbf308821c34869a2e38406ff0edcd1',
      ),
    );

    log(response.results.first.toString());
  }

  Future<void> updateSubscription() async {
    final response = await mercadoPago.updateSubscription(
      body: UpdateSubscriptionRequestBody(
        id: '14d8136fcfd64211af49e7c516ef639e',
        status: "authorized",
      ),
    );

    log(response.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text("Run"),
          onPressed: () async {
            /// --- Preferences
            // createPreference();
            // searchPreferences();
            // getPreference();
            // updatePreference();

            /// --- Subscriptions
            // createSubscription();
            // searchSubscriptions();
            // getSubscription();
            // updateSubscription();
          },
        ),
      ),
    );
  }
}

```

### Backend Setup

Since this package uses a backend to work, here is an example of a simple Python (Flask) backend that integrates with Mercado Pago. This backend handles preferences, subscriptions, and events (webhooks).

### Backend Folder Structure

```
backend/
├── main.py
├── routes/
│ ├── events.py
│ ├── preferences.py
│ └── subscriptions.py
├── sdk_client.py
├── utils.py
├── config.py
├── env.json
├── requirements.txt
└── README.md
```

### main.py

```python
from flask import Flask
from flask_cors import CORS
from routes.preferences import preferences_bp
from routes.subscriptions import subscriptions_bp
from routes.events import events_bp

app = Flask(__name__)

CORS(app)

app.register_blueprint(preferences_bp)
app.register_blueprint(subscriptions_bp)
app.register_blueprint(events_bp)

if __name__ == "__main__":

app.run(debug=True)
```

* Explanation:
Sets up a Flask app with CORS enabled. Registers blueprints for preferences, subscriptions, and events.

### events.py

This endpoint listens to the webhook configured in Mercado Pago.

```python
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
            external_reference = preapproval.get("external_reference", "")
            log_data(external_reference, 'external_reference')
            return {'message': 'Subscription approved!'}

        if preapproval['status'] == "cancelled":
            return {'message': 'Subscription cancelled!'}

    # Preferences (Payments)
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
```

### preferences.py

```python
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

@preferences_bp.route("/get-preference", methods=["GET"])
def get_preference():
    data = request.json or {}
    response = sdk.preference().get(data["id"])
    return response["response"], response["status"]

@preferences_bp.route("/update-preference", methods=["PUT"])
def update_preference():
    data = request.json or {}
    response = sdk.preference().update(data["id"], data)
    return response["response"], response["status"]
```

### subscriptions.py

```python
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

@subscriptions_bp.route("/update-subscription", methods=["PUT"])
def update_subscription():
    data = request.json or {}
    response = sdk.preapproval().update(data["id"], data)
    return response["response"], response["status"]
```

### Additional Information

#### Exposing Your Backend to the Internet

If you need to test webhooks or external notifications from Mercado Pago, you can expose your backend to the internet. Check out this [YouTube video](https://www.youtube.com/watch?v=FujS16J74Gk&ab_channel=DeeecodeTheWeb) for a guide on how to do that using VSCode.

#### Check the user subscriptions

Check here: [Mercado Pago Subscription Plans](https://www.mercadopago.com.uy/subscription-plans/onboarding)

#### Example Videos

* Subscriptions Example: [Watch on YouTube](https://www.youtube.com/watch?v=s-vb-uu6C0k&ab_channel=Goncy)
* Preferences Example: [Watch on YouTube](https://www.youtube.com/watch?v=BUHUW7tAr_Y&t=1154s&ab_channel=Goncy)