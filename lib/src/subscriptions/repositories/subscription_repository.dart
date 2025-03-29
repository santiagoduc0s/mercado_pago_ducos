import 'package:mercado_pago_flowlabs/src/subscriptions/datasources/datasources.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/entities/responses/responses.dart';

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
}
