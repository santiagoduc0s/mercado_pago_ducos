/// Represents a person's identification data.
///
/// This class encapsulates the identification type (e.g., "DNI", "CI", "CPF")
/// and the identification number.
class Identification {
  /// Identification type.
  /// For example: "DNI", "CI", "CPF".
  final String? type;

  /// Identification number.
  /// For example: "19119119100".
  final String? number;

  /// Creates an instance of [Identification].
  ///
  /// Both [type] and [number] are optional.
  Identification({
    this.type,
    this.number,
  });

  /// Creates an [Identification] instance from a JSON map.
  ///
  /// The [json] map should contain:
  /// - 'type': the identification type,
  /// - 'number': the identification number.
  factory Identification.fromJson(Map<String, dynamic> json) {
    return Identification(
      type: json['type'],
      number: json['number'],
    );
  }

  /// Converts the [Identification] instance into a JSON map.
  ///
  /// The returned map includes the keys 'type' and 'number'.
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
    }..removeWhere((key, value) => value == null);
  }
}
