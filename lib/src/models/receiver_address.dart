class ReceiverAddress {
  /// Zip code.
  final String? zipCode;

  /// Street name.
  final String? streetName;

  /// City name.
  final String? cityName;

  /// State name.
  final String? stateName;

  /// Street number.
  final int? streetNumber;

  /// Floor.
  final String? floor;

  /// Apartment.
  final String? apartment;

  /// Country name.
  final String? countryName;

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
