import 'package:mercado_pago_ducos/src/core/client/client.dart' show RequestBody;

/// Represents the request payload for searching subscriptions.
///
/// This class implements the [RequestBody] interface and provides various
/// filtering and sorting options for querying subscriptions.
class SearchSubscriptionsRequestBody implements RequestBody {
  /// A free text search field for generic queries.
  final String? q;

  /// A unique numeric ID that identifies the customer associated with the subscription.
  final int? payerId;

  /// The customer's email address used to filter subscriptions registered under this email.
  final String? payerEmail;

  /// The identifier for a specific subscription plan used to filter results.
  ///
  /// Example: "2c938084726fca480172750000000000".
  final String? preapprovalPlanId;

  /// A numeric value representing the subscription amount for filtering results.
  final int? transactionAmount;

  /// A string indicating the control status of the subscription.
  ///
  /// Example: "green".
  final String? semaphore;

  /// A comma-separated string of statuses (e.g., "authorized,cancelled,paused")
  /// used to filter subscriptions based on their state.
  final String? status;

  /// A string that defines the sorting order for the returned subscriptions.
  ///
  /// Format: "field_name:sort_type", e.g., "payer_id:asc".
  final String? sort;

  /// A numeric offset that specifies the starting position in the collection of results.
  ///
  /// Useful for pagination.
  final int? offset;

  /// A numeric limit that defines the maximum number of items to return.
  final int? limit;

  /// Creates an instance of [SearchSubscriptionsRequestBody] with optional filtering parameters.
  SearchSubscriptionsRequestBody({
    this.q,
    this.payerId,
    this.payerEmail,
    this.preapprovalPlanId,
    this.transactionAmount,
    this.semaphore,
    this.status,
    this.sort,
    this.offset,
    this.limit,
  });

  /// Converts the subscription search parameters into a JSON-compatible map.
  ///
  /// Only non-null values are included in the resulting map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'q': q,
      'payer_id': payerId,
      'payer_email': payerEmail,
      'preapproval_plan_id': preapprovalPlanId,
      'transaction_amount': transactionAmount,
      'semaphore': semaphore,
      'status': status,
      'sort': sort,
      'offset': offset,
      'limit': limit,
    }..removeWhere((key, value) => value == null);
  }
}
