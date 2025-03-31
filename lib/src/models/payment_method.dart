/// Model for a single payment method.
class PaymentMethod {
  /// Identifier for the payment method.
  final String id;

  PaymentMethod({required this.id});

  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
