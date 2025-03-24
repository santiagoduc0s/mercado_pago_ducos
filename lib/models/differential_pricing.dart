class DifferentialPricing {
  /// Differential pricing ID.
  final int? id;

  DifferentialPricing({this.id});

  factory DifferentialPricing.fromJson(Map<String, dynamic> json) {
    return DifferentialPricing(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
