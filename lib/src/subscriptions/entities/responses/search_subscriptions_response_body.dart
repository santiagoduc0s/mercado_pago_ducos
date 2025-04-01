import 'package:mercado_pago_ducos/src/core/client/client.dart' show ResponseBody;
import 'package:mercado_pago_ducos/src/models/models.dart';

/// Response payload for searching subscriptions (preapprovals).
///
/// The response includes:
/// - [paging]: An object containing pagination details (offset, limit, total).
/// - [results]: An array of subscription items. This will be empty if there are no results.
class SearchSubscriptionsResponseBody implements ResponseBody {
  /// Pagination details, including the offset, limit, and total number of items.
  final Paging paging;

  /// A list of subscription items returned by the search query.
  final List<Subscription> results;

  /// Creates an instance of [SearchSubscriptionsResponseBody] with the provided [paging] and [results].
  SearchSubscriptionsResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance of [SearchSubscriptionsResponseBody] from a JSON object.
  ///
  /// The JSON map must include:
  /// - 'paging': A JSON object with pagination details.
  /// - 'results': A JSON array of subscription items.
  factory SearchSubscriptionsResponseBody.fromJson(Map<String, dynamic> json) {
    return SearchSubscriptionsResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => Subscription.fromJson(item))
          .toList(),
    );
  }
}
