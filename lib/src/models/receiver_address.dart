/// Represents the address details for the receiver.
///
/// This class includes various address components such as zip code, street and city names,
/// state, floor, apartment, and country name.
class ReceiverAddress {
  /// The zip code of the address.
  final String? zipCode;

  /// The street name.
  final String? streetName;

  /// The name of the city.
  final String? cityName;

  /// The name of the state.
  final String? stateName;

  /// The street number.
  final int? streetNumber;

  /// The floor number (if applicable).
  final String? floor;

  /// The apartment number (if applicable).
  final String? apartment;

  /// The name of the country.
  final String? countryName;

  /// Creates an instance of [ReceiverAddress] with the given address details.
  ReceiverAddress({
    this.zipCode,
    this.streetName,
    this.cityName,
    this.stateName,
    this.streetNumber,
    this.floor,
    this.apartment,
    this.countryName,
  });

  /// Creates a [ReceiverAddress] instance from a JSON map.
  ///
  /// The JSON map should include keys corresponding to the address components:
  /// - 'zip_code', 'street_name', 'city_name', 'state_name', 'street_number',
  ///   'floor', 'apartment', and 'country_name'.
  factory ReceiverAddress.fromJson(Map<String, dynamic> json) {
    return ReceiverAddress(
      zipCode: json['zip_code'],
      streetName: json['street_name'],
      cityName: json['city_name'],
      stateName: json['state_name'],
      streetNumber: json['street_number'],
      floor: json['floor'],
      apartment: json['apartment'],
      countryName: json['country_name'],
    );
  }

  /// Converts the [ReceiverAddress] instance into a JSON map.
  ///
  /// Any key with a `null` value is removed from the resulting map to keep the JSON clean.
  Map<String, dynamic> toJson() {
    return {
      "zip_code": zipCode,
      "street_name": streetName,
      "city_name": cityName,
      "state_name": stateName,
      "street_number": streetNumber,
      "floor": floor,
      "apartment": apartment,
      "country_name": countryName,
    }..removeWhere((key, value) => value == null);
  }
}
