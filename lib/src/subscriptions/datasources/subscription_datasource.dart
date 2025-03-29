import 'package:mercado_pago_flowlabs/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/entities/responses/responses.dart';

abstract class SubscriptionDatasource {
  Future<CreateSubscriptionResponseBody> createSubscription(
    CreateSubscriptionRequestBody body,
  );
}
