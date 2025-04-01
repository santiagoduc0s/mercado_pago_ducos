/// Represents a payment type that should be excluded.
///
/// This class encapsulates the identifier for a payment type,
/// which can be used to filter out specific payment types.
class ExcludedPaymentType {
  /// Payment type identifier.
  final String? id;

  /// Creates an instance of [ExcludedPaymentType].
  ///
  /// The [id] parameter is optional.
  ExcludedPaymentType({this.id});

  /// Creates an [ExcludedPaymentType] instance from a JSON map.
  ///
  /// The [json] map should contain the key 'id' corresponding to the payment type identifier.
  factory ExcludedPaymentType.fromJson(Map<String, dynamic> json) {
    return ExcludedPaymentType(
      id: json['id'],
    );
  }

  /// Converts the [ExcludedPaymentType] instance into a JSON map.
  ///
  /// The returned map includes the 'id' key.
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null); // Clean up JSON by removing null entries.
  }
}
