import 'package:mercado_pago_flowlabs/src/core/client/client.dart' show ResponseBody;
import 'package:mercado_pago_flowlabs/src/models/models.dart';

/// Response payload for searching subscription plans.
///
/// The response includes:
/// - [paging]: An object containing pagination details (offset, limit, total).
/// - [results]: An array of plan items. This will be empty if there are no results.
class SearchPlansResponseBody implements ResponseBody {
  /// Pagination details: offset, limit, and total number of items.
  final Paging paging;

  /// The page of plan items.
  final List<Plan> results;

  SearchPlansResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance from a JSON object.
  factory SearchPlansResponseBody.fromJson(Map<String, dynamic> json) {
    return SearchPlansResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => Plan.fromJson(item))
          .toList(),
    );
  }
}
