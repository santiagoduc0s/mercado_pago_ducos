/// A model class representing an address.
/// This class contains details such as zip code, street name, and street number.
class Address {
  // Optional zip code for the address.
  final String? zipCode;

  // Optional street name for the address.
  final String? streetName;

  // Optional street number for the address.
  final int? streetNumber;

  /// Constructor for creating an [Address] instance.
  /// All parameters are optional.
  Address({
    this.zipCode,
    this.streetName,
    this.streetNumber,
  });

  /// Creates an [Address] instance from a JSON [Map].
  ///
  /// The [json] Map should contain keys corresponding to:
  /// - 'zip_code' for the zip code.
  /// - 'street_name' for the street name.
  /// - 'street_number' for the street number.
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zip_code'],
      streetName: json['street_name'],
      streetNumber: json['street_number'],
    );
  }

  /// Converts the [Address] instance to a JSON [Map].
  ///
  /// The returned Map uses:
  /// - 'zip_code' as key for [zipCode],
  /// - 'street_name' as key for [streetName], and
  /// - 'street_number' as key for [streetNumber].
  ///
  /// Any keys with a null value are removed from the resulting Map.
  Map<String, dynamic> toJson() {
    return {
      "zip_code": zipCode,
      "street_name": streetName,
      "street_number": streetNumber,
    }..removeWhere((key, value) => value == null);
  }
}
