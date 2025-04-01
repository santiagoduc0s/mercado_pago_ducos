/// Represents a phone number.
///
/// This class encapsulates the details of a phone number,
/// including an optional area code and the number itself.
class Phone {
  /// The area code of the phone number.
  final String? areaCode;

  /// The actual phone number.
  final String? number;

  /// Creates an instance of [Phone] with the given [areaCode] and [number].
  Phone({
    this.areaCode,
    this.number,
  });

  /// Creates a [Phone] instance from a JSON map.
  ///
  /// The JSON map should contain:
  /// - 'area_code': the area code of the phone number.
  /// - 'number': the phone number.
  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      areaCode: json['area_code'],
      number: json['number'],
    );
  }

  /// Converts the [Phone] instance into a JSON map.
  ///
  /// The returned map includes the keys 'area_code' and 'number'.
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      "area_code": areaCode,
      "number": number,
    }..removeWhere((key, value) => value == null);
  }
}
