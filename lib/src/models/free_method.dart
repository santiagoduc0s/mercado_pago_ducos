/// Represents a shipping method used for free shipping or related purposes.
///
/// This class encapsulates the identifier for a shipping method.
class FreeMethod {
  /// Shipping method ID.
  final int? id;

  /// Creates an instance of [FreeMethod].
  ///
  /// The [id] parameter is optional.
  FreeMethod({this.id});

  /// Creates a [FreeMethod] instance from a JSON map.
  ///
  /// The JSON map should contain the key 'id' corresponding to the shipping method ID.
  factory FreeMethod.fromJson(Map<String, dynamic> json) {
    return FreeMethod(
      id: json['id'],
    );
  }

  /// Converts the [FreeMethod] instance into a JSON map.
  ///
  /// The resulting map includes the key 'id'. Any key with a `null` value is removed.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
