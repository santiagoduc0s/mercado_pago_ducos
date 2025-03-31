class PaymentMethodsAllowed {
  /// List of allowed payment types.
  final List<String> paymentTypes;

  PaymentMethodsAllowed({required this.paymentTypes});

  factory PaymentMethodsAllowed.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsAllowed(
      paymentTypes: List<String>.from(json['payment_types'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'payment_types': paymentTypes,
    };
  }
}
