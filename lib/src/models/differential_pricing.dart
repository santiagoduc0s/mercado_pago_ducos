/// Represents differential pricing information.
///
/// This class is used to encapsulate the differential pricing ID which can be used
/// to determine different pricing strategies.
class DifferentialPricing {
  /// Differential pricing ID.
  final int? id;

  /// Creates an instance of [DifferentialPricing].
  ///
  /// The [id] parameter is optional.
  DifferentialPricing({this.id});

  /// Creates a [DifferentialPricing] instance from a JSON map.
  ///
  /// The [json] map should contain the key 'id' corresponding to the differential pricing ID.
  factory DifferentialPricing.fromJson(Map<String, dynamic> json) {
    return DifferentialPricing(
      id: json['id'],
    );
  }

  /// Converts the [DifferentialPricing] instance to a JSON map.
  ///
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) =>
        value == null); // Clean up the JSON by removing null values.
  }
}
