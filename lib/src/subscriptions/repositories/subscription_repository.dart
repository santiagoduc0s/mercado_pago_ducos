import 'package:mercado_pago_ducos/src/subscriptions/datasources/datasources.dart'
    show SubscriptionDatasource;
import 'package:mercado_pago_ducos/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_ducos/src/subscriptions/entities/responses/responses.dart';

class SubscriptionRepository {
  SubscriptionRepository({
    required this.datasource,
  });

  final SubscriptionDatasource datasource;

  Future<CreateSubscriptionResponseBody> createSubscription(
    CreateSubscriptionRequestBody request,
  ) {
    return datasource.createSubscription(request);
  }

  Future<SearchSubscriptionsResponseBody> searchSubscriptions(
    SearchSubscriptionsRequestBody request,
  ) {
    return datasource.searchSubscriptions(request);
  }

  Future<GetSubscriptionResponseBody> getSubscription(
    GetSubscriptionRequestBody request,
  ) {
    return datasource.getSubscription(request);
  }

  Future<UpdateSubscriptionResponseBody> updateSubscription(
    UpdateSubscriptionRequestBody request,
  ) {
    return datasource.updateSubscription(request);
  }
}
