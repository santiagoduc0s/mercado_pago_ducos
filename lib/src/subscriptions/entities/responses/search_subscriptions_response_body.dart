import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show ResponseBody;
import 'package:mercado_pago_ducos/src/models/models.dart';

/// Response payload for searching subscriptions (preapprovals).
///
/// The response includes:
/// - [paging]: An object containing pagination details (offset, limit, total).
/// - [results]: An array of subscription items. This will be empty if there are no results.
class SearchSubscriptionsResponseBody implements ResponseBody {
  /// Pagination details: offset, limit, and total number of items.
  final Paging paging;

  /// The page of subscription items.
  final List<Subscription> results;

  SearchSubscriptionsResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance from a JSON object.
  factory SearchSubscriptionsResponseBody.fromJson(Map<String, dynamic> json) {
    return SearchSubscriptionsResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => Subscription.fromJson(item))
          .toList(),
    );
  }
}

