/// Represents callback URLs used after payment processing.
///
/// Each URL corresponds to a specific state of the payment process.
class BackUrls {
  /// URL to redirect to when the payment is approved.
  final String? success;

  /// URL to redirect to when the payment is pending or in process.
  final String? pending;

  /// URL to redirect to when the payment is canceled or fails.
  final String? failure;

  /// Creates an instance of [BackUrls].
  ///
  /// All parameters are optional and represent the URLs for different payment statuses.
  BackUrls({
    this.success,
    this.pending,
    this.failure,
  });

  /// Constructs a [BackUrls] instance from a JSON map.
  ///
  /// The [json] map should contain the keys:
  /// - 'success' for the approved payment URL,
  /// - 'pending' for the pending payment URL, and
  /// - 'failure' for the canceled payment URL.
  factory BackUrls.fromJson(Map<String, dynamic> json) {
    return BackUrls(
      success: json['success'],
      pending: json['pending'],
      failure: json['failure'],
    );
  }

  /// Converts the [BackUrls] instance to a JSON map.
  ///
  /// The returned map will include the keys for success, pending, and failure.
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "pending": pending,
      "failure": failure,
    }..removeWhere((key, value) => value == null);
  }
}
