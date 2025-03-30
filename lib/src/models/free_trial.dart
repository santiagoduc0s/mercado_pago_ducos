/// Data for free trial configuration.
class FreeTrial {
  /// Frequency value for the free trial cycle.
  final int frequency;

  /// Frequency type, e.g. "days" or "months".
  final String frequencyType;

  /// Creates an instance of [FreeTrial].
  FreeTrial({
    required this.frequency,
    required this.frequencyType,
  });

  /// Creates a [FreeTrial] instance from a JSON map.
  factory FreeTrial.fromJson(Map<String, dynamic> json) {
    return FreeTrial(
      frequency: json['frequency'],
      frequencyType: json['frequency_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'frequency': frequency,
      'frequency_type': frequencyType,
    }..removeWhere((key, value) => value == null);
  }

}
