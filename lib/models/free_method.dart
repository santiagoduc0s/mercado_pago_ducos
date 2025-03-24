class FreeMethod {
  /// Shipping method ID.
  final int? id;

  FreeMethod({this.id});

  factory FreeMethod.fromJson(Map<String, dynamic> json) {
    return FreeMethod(
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    }..removeWhere((key, value) => value == null);
  }
}
