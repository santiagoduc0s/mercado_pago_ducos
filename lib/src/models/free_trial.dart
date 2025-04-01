/// Data for free trial configuration.
///
/// This class encapsulates the details for configuring a free trial period,
/// including the duration and frequency of the trial period.
class FreeTrial {
  /// Frequency value for the free trial cycle.
  ///
  /// This value, combined with [frequencyType], determines the length of the trial cycle.
  final int frequency;

  /// Frequency type, e.g. "days" or "months".
  ///
  /// This string specifies the unit for the [frequency] (e.g., how many days or months).
  final String frequencyType;

  /// Optional: Offset for the first invoice after the free trial period.
  ///
  /// This can be used to delay the start of invoicing after the trial ends.
  final int? firstInvoiceOffset;

  /// Creates an instance of [FreeTrial].
  ///
  /// The [frequency] and [frequencyType] parameters are required,
  /// while [firstInvoiceOffset] is optional.
  FreeTrial({
    required this.frequency,
    required this.frequencyType,
    this.firstInvoiceOffset,
  });

  /// Creates a [FreeTrial] instance from a JSON map.
  ///
  /// The [json] map should include:
  /// - 'frequency': the frequency value for the trial,
  /// - 'frequency_type': the unit for the frequency,
  /// - 'first_invoice_offset': (optional) the offset for the first invoice.
  factory FreeTrial.fromJson(Map<String, dynamic> json) {
    return FreeTrial(
      frequency: json['frequency'],
      frequencyType: json['frequency_type'],
      firstInvoiceOffset: json['first_invoice_offset'],
    );
  }

  /// Converts the [FreeTrial] instance into a JSON map.
  ///
  /// The returned map includes the keys 'frequency', 'frequency_type',
  /// and 'first_invoice_offset'. Any key with a `null` value is removed.
  Map<String, dynamic> toJson() {
    return {
      'frequency': frequency,
      'frequency_type': frequencyType,
      'first_invoice_offset': firstInvoiceOffset,
    }..removeWhere((key, value) =>
        value == null); // Clean up the map by removing null entries.
  }
}
