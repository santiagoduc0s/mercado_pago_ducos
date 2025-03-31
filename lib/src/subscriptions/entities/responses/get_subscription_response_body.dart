import 'package:mercado_pago_flowlabs/src/core/client/client.dart'
    show ResponseBody;
import 'package:mercado_pago_flowlabs/src/models/models.dart';

class GetSubscriptionResponseBody implements ResponseBody {
  /// Pagination details: offset, limit, and total number of items.
  final Paging paging;

  /// The page of subscription items.
  final List<Subscription> results;

  GetSubscriptionResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance from a JSON object.
  factory GetSubscriptionResponseBody.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => Subscription.fromJson(item))
          .toList(),
    );
  }
}

