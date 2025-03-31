import 'package:mercado_pago_flowlabs/src/core/client/client.dart'
    show RequestBody;

/// Represents the request payload for searching plans.
class SearchPlansRequestBody implements RequestBody {
  /// Specifies the status of the plan you want to retrieve.
  /// Example: "active".
  final String? status;

  /// A free text search field for generic queries.
  /// Example: "Plan gold".
  final String? q;

  /// Specifies the field by which the results will be ordered.
  /// Example: "date_created".
  final String? sort;

  /// Specifies the criteria for ordering the results.
  /// Example: "asc".
  final String? criteria;

  /// Specifies the offset for the first item to be returned.
  /// Example: 20.
  final int? offset;

  /// Specifies the maximum number of items to be returned.
  /// Example: 20.
  final int? limit;

  SearchPlansRequestBody({
    this.status,
    this.q,
    this.sort,
    this.criteria,
    this.offset,
    this.limit,
  });

  /// Converts the plan search parameters into a JSON-compatible map.
  ///
  /// Only non-null values are included in the resulting map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'q': q,
      'sort': sort,
      'criteria': criteria,
      'offset': offset,
      'limit': limit,
    }..removeWhere((key, value) => value == null);
  }
}
