/// Model for specifying allowed payment methods by payment type.
///
/// This class encapsulates a list of allowed payment types.
class PaymentMethodsAllowed {
  /// List of allowed payment types.
  ///
  /// For example, this list may include values like "credit_card", "debit_card", etc.
  final List<String> paymentTypes;

  /// Creates an instance of [PaymentMethodsAllowed] with the given [paymentTypes].
  PaymentMethodsAllowed({required this.paymentTypes});

  /// Creates a [PaymentMethodsAllowed] instance from a JSON map.
  ///
  /// The JSON map should contain the key 'payment_types' which is converted
  /// to a list of strings. If the key is not present, an empty list is used.
  factory PaymentMethodsAllowed.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsAllowed(
      paymentTypes: List<String>.from(json['payment_types'] ?? []),
    );
  }

  /// Converts the [PaymentMethodsAllowed] instance into a JSON map.
  ///
  /// Returns a map with the key 'payment_types' corresponding to the list of allowed payment types.
  Map<String, dynamic> toJson() {
    return {
      'payment_types': paymentTypes,
    };
  }
}
