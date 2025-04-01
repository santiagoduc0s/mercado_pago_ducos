import 'package:mercado_pago_ducos/src/core/client/client.dart';
import 'package:mercado_pago_ducos/src/subscriptions/datasources/subscription_datasource.dart';
import 'package:mercado_pago_ducos/src/subscriptions/entities/requests/requests.dart';
import 'package:mercado_pago_ducos/src/subscriptions/entities/responses/responses.dart';

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

  @override
  Future<SearchSubscriptionsResponseBody> searchSubscriptions(
    SearchSubscriptionsRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/subscriptions/search-subscriptions',
      method: HttpMethod.get,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return SearchSubscriptionsResponseBody.fromJson(response.data);
  }

  @override
  Future<GetSubscriptionResponseBody> getSubscription(
    GetSubscriptionRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/subscriptions/search-subscriptions',
      method: HttpMethod.get,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return GetSubscriptionResponseBody.fromJson(response.data);
  }

  @override
  Future<UpdateSubscriptionResponseBody> updateSubscription(
    UpdateSubscriptionRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/subscriptions/update-subscription',
      method: HttpMethod.put,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return UpdateSubscriptionResponseBody.fromJson(response.data);
  }
}
