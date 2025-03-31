import 'package:mercado_pago_flowlabs/src/plans/entities/requests/requests.dart';
import 'package:mercado_pago_flowlabs/src/plans/entities/responses/responses.dart';

abstract class PlanDatasource {
  Future<SearchPlansResponseBody> searchPlans(
    SearchPlansRequestBody body,
  );
}
