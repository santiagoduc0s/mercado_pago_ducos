import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show ResponseBody;
import 'package:mercado_pago_ducos/src/models/models.dart';

/// Response payload for retrieving subscriptions with pagination.
///
/// This class encapsulates the paging information along with the list of subscription items.
class GetSubscriptionResponseBody implements ResponseBody {
  /// Pagination details: includes offset, limit, and total number of items.
  final Paging paging;

  /// The list (page) of subscription items.
  final List<Subscription> results;

  /// Creates an instance of [GetSubscriptionResponseBody] with the provided paging and results.
  GetSubscriptionResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance from a JSON object.
  ///
  /// The JSON map must contain the keys:
  /// - 'paging': An object with pagination details.
  /// - 'results': A list of subscription items.
  factory GetSubscriptionResponseBody.fromJson(Map<String, dynamic> json) {
    return GetSubscriptionResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => Subscription.fromJson(item))
          .toList(),
    );
  }
}
