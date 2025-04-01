/// Model for a single payment method.
///
/// This class encapsulates the details for a payment method, identified by a unique ID.
class PaymentMethod {
  /// Identifier for the payment method.
  final String id;

  /// Creates an instance of [PaymentMethod] with the given [id].
  PaymentMethod({required this.id});

  /// Creates a [PaymentMethod] instance from a JSON map.
  ///
  /// The JSON map should contain the key 'id' which is cast to a [String].
  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String,
    );
  }

  /// Converts the [PaymentMethod] instance into a JSON map.
  ///
  /// Returns a map containing the key 'id'.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
