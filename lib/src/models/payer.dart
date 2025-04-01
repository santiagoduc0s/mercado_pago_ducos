import 'package:mercado_pago_ducos/src/models/models.dart'
    show Phone, Identification, Address;

/// Represents a buyer (payer) in the payment process.
///
/// This class includes details about the buyer such as name, email, phone, identification,
/// address, and the registration date.
class Payer {
  /// Buyer's first name.
  final String? name;

  /// Buyer's last name.
  final String? surname;

  /// Buyer's email address.
  final String? email;

  /// Buyer's phone information.
  final Phone? phone;

  /// Buyer's personal identification.
  final Identification? identification;

  /// Buyer's address.
  final Address? address;

  /// Buyer's registration date.
  /// Example: "2024-04-01T00:00:00Z"
  final String? dateCreated;

  /// Creates an instance of [Payer].
  ///
  /// All fields are optional.
  Payer({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.identification,
    this.address,
    this.dateCreated,
  });

  /// Creates a [Payer] instance from a JSON map.
  ///
  /// The JSON map should contain keys corresponding to the properties of the class.
  factory Payer.fromJson(Map<String, dynamic> json) {
    return Payer(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      // Parse phone data if available.
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      // Parse identification data if available.
      identification: json['identification'] != null
          ? Identification.fromJson(json['identification'])
          : null,
      // Parse address data if available.
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      dateCreated: json['date_created'],
    );
  }

  /// Converts the [Payer] instance into a JSON map.
  ///
  /// This method uses non-null assertions for [phone], [identification],
  /// and [address]. Ensure these properties are not null when calling [toJson].
  /// Any key with a `null` value is removed from the final map.
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "email": email,
      // Convert phone, identification, and address to JSON.
      "phone": phone!.toJson(),
      "identification": identification!.toJson(),
      "address": address!.toJson(),
      "date_created": dateCreated,
    }..removeWhere((key, value) => value == null);
  }
}
