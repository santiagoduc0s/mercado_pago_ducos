class Phone {
  /// Area code.
  final String? areaCode;

  /// Number.
  final String? number;

  Phone({
    this.areaCode,
    this.number,
  });

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      areaCode: json['area_code'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "area_code": areaCode,
      "number": number,
    }..removeWhere((key, value) => value == null);
  }
}
