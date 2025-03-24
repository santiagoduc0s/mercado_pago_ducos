class ExcludedPaymentType {
  /// Payment method data_type ID.
  final String? id;

  ExcludedPaymentType({this.id});

  factory ExcludedPaymentType.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentType(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
