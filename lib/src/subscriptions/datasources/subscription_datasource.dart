import 'package:mercado_pago_ducos/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_ducos/src/subscriptions/entities/responses/responses.dart';

abstract class SubscriptionDatasource {
  Future<CreateSubscriptionResponseBody> createSubscription(
    CreateSubscriptionRequestBody body,
  );

  Future<SearchSubscriptionsResponseBody> searchSubscriptions(
    SearchSubscriptionsRequestBody body,
  );

  Future<GetSubscriptionResponseBody> getSubscription(
    GetSubscriptionRequestBody body,
  );

  Future<UpdateSubscriptionResponseBody> updateSubscription(
    UpdateSubscriptionRequestBody body,
  );
}
