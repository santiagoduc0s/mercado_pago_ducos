import 'package:mercado_pago_flowlabs/src/core/client/client.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/datasources/subscription_datasource.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/subscriptions/entities/responses/responses.dart';

class SubscriptionApiDatasource implements SubscriptionDatasource {
  SubscriptionApiDatasource({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<CreateSubscriptionResponseBody> createSubscription(
    CreateSubscriptionRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/subscriptions/create-subscription',
      method: HttpMethod.post,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return CreateSubscriptionResponseBody.fromJson(response.data);
  }
}
