class Identification {
  /// Identification Type.
  /// Example: "DNI", "CI", "CPF"
  final String? type;

  /// Number.
  /// Example: "19119119100"
  final String? number;

  Identification({
    this.type,
    this.number,
  });

  factory Identification.fromJson(Map<String, dynamic> json) {
    return Identification(
      type: json['type'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "number": number,
    }..removeWhere((key, value) => value == null);
  }
}
