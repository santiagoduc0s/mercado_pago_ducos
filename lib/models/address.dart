class Address {
  /// Zip code.
  final String? zipCode;

  /// Street name.
  final String? streetName;

  /// Street number.
  final int? streetNumber;

  Address({
    this.zipCode,
    this.streetName,
    this.streetNumber,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      zipCode: json['zip_code'],
      streetName: json['street_name'],
      streetNumber: json['street_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "zip_code": zipCode,
      "street_name": streetName,
      "street_number": streetNumber,
    }..removeWhere((key, value) => value == null);
  }
}
