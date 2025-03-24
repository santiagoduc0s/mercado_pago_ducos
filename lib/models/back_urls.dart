class BackUrls {
  /// Approved payment URL.
  final String? success;

  /// Pending or in process payment URL.
  final String? pending;

  /// Canceled payment URL.
  final String? failure;

  BackUrls({
    this.success,
    this.pending,
    this.failure,
  });

  factory BackUrls.fromJson(Map<String, dynamic> json) {
    return BackUrls(
      success: json['success'],
      pending: json['pending'],
      failure: json['failure'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "pending": pending,
      "failure": failure,
    }..removeWhere((key, value) => value == null);
  }
}
