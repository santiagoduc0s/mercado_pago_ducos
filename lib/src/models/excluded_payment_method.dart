/// Represents a payment method that should be excluded.
///
/// This can be used to filter out specific payment methods such as "visa" or "ticket".
class ExcludedPaymentMethod {
  /// Payment method ID.
  /// For example: "visa", "ticket".
  final String? id;

  /// Creates an instance of [ExcludedPaymentMethod].
  ///
  /// The [id] parameter is optional.
  ExcludedPaymentMethod({this.id});

  /// Creates an [ExcludedPaymentMethod] instance from a JSON map.
  ///
  /// The [json] map should contain the key 'id' corresponding to the payment method ID.
  factory ExcludedPaymentMethod.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentMethod(
      id: json['id'],
    );
  }

  /// Converts the [ExcludedPaymentMethod] instance into a JSON map.
  ///
  /// The returned map will include the key 'id'.
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
