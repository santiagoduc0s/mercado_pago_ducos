class ExcludedPaymentMethod {
  /// Payment method ID.
  /// Example: "visa", "ticket"
  final String? id;

  ExcludedPaymentMethod({this.id});

  factory ExcludedPaymentMethod.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentMethod(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
