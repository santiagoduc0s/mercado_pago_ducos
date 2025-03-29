/// Configuration data for recurring payments.
class AutoRecurring {
  /// Frequency value that, along with [frequencyType], defines the invoice cycle.
  final int frequency;

  /// Frequency type, e.g. "days" or "months".
  final String frequencyType;

  /// Date from which the subscription will be active.
  final String? startDate;

  /// Date until which the subscription will be active.
  final String? endDate;

  /// ID of the currency used in the payment.
  final String currencyId;

  /// Amount to charge on each invoice.
  final num transactionAmount;

  /// Creates an instance of [AutoRecurring].
  AutoRecurring({
    required this.frequency,
    required this.frequencyType,
    this.startDate,
    this.endDate,
    required this.currencyId,
    required this.transactionAmount,
  });

  /// Creates an [AutoRecurring] instance from a JSON map.
  factory AutoRecurring.fromJson(Map<String, dynamic> json) {
    return AutoRecurring(
      frequency: json['frequency'],
      frequencyType: json['frequency_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      currencyId: json['currency_id'],
      transactionAmount: json['transaction_amount'],
    );
  }

  /// Converts the [AutoRecurring] instance into a JSON map.
  ///
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      'frequency': frequency,
      'frequency_type': frequencyType,
      'start_date': startDate,
      'end_date': endDate,
      'currency_id': currencyId,
      'transaction_amount': transactionAmount,
    }..removeWhere((key, value) => value == null);
  }
}
