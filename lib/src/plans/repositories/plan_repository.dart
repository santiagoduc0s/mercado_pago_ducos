import 'package:mercado_pago_flowlabs/src/plans/datasources/datasources.dart';
import 'package:mercado_pago_flowlabs/src/plans/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/plans/entities/responses/responses.dart';

class PlanRepository {
  PlanRepository({
    required this.datasource,
  });

  final PlanDatasource datasource;

  Future<SearchPlansResponseBody> searchPlans(
    SearchPlansRequestBody request,
  ) {
    return datasource.searchPlans(request);
  }
}
