import 'package:mercado_pago_flowlabs/src/core/client/client.dart';
import 'package:mercado_pago_flowlabs/src/plans/datasources/plan_datasource.dart';
import 'package:mercado_pago_flowlabs/src/plans/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/plans/entities/responses/responses.dart';

class PlanApiDatasource implements PlanDatasource {
  PlanApiDatasource({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<SearchPlansResponseBody> searchPlans(
    SearchPlansRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/plans/search-plans',
      method: HttpMethod.get,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return SearchPlansResponseBody.fromJson(response.data);
  }
}
