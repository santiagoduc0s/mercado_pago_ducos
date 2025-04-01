import 'package:mercado_pago_ducos/src/models/models.dart'
    show Phone, Identification, Address;

class Payer {
  /// Buyer name.
  final String? name;

  /// Buyer last name.
  final String? surname;

  /// Buyer e-mail address.
  final String? email;

  /// Buyer phone.
  final Phone? phone;

  /// Personal identification.
  final Identification? identification;

  /// Buyer’s address.
  final Address? address;

  /// Registration date.
  /// Example: "2024-04-01T00:00:00Z"
  final String? dateCreated;

  Payer({
    this.name,
    this.surname,
    this.email,
    this.phone,
    this.identification,
    this.address,
    this.dateCreated,
  });

  factory Payer.fromJson(Map<String, dynamic> json) {
    return Payer(
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      phone: json['phone'] != null ? Phone.fromJson(json['phone']) : null,
      identification: json['identification'] != null
          ? Identification.fromJson(json['identification'])
          : null,
      address:
          json['address'] != null ? Address.fromJson(json['address']) : null,
      dateCreated: json['date_created'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "email": email,
      "phone": phone!.toJson(),
      "identification": identification!.toJson(),
      "address": address!.toJson(),
      "date_created": dateCreated,
    }..removeWhere((key, value) => value == null);
  }
}
