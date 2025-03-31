import 'package:mercado_pago_flowlabs/src/models/models.dart';

/// Configuration data for recurring payments.
class AutoRecurring {
  /// Frequency value that, along with [frequencyType], defines the invoice cycle.
  final int frequency;

  /// Frequency type, e.g. "days" or "months".
  final String frequencyType;

  final int? repetitions;

  final int? billingDay;

  final bool? billingDayProportional;

  /// Date from which the subscription will be active.
  final String? startDate;

  /// Date until which the subscription will be active.
  final String? endDate;

  /// ID of the currency used in the payment.
  final String currencyId;

  /// Amount to charge on each invoice.
  final num transactionAmount;

  /// Free trial data.
  final FreeTrial? freeTrial;

  /// Creates an instance of [AutoRecurring].
  AutoRecurring({
    required this.frequency,
    required this.frequencyType,
    this.repetitions,
    this.billingDay,
    this.billingDayProportional,
    this.startDate,
    this.endDate,
    required this.currencyId,
    required this.transactionAmount,
    this.freeTrial,
  });

  /// Creates an [AutoRecurring] instance from a JSON map.
  factory AutoRecurring.fromJson(Map<String, dynamic> json) {
    return AutoRecurring(
      frequency: json['frequency'],
      frequencyType: json['frequency_type'],
      repetitions: json['repetitions'],
      billingDay: json['billing_day'],
      billingDayProportional: json['billing_day_proportional'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      currencyId: json['currency_id'],
      transactionAmount: json['transaction_amount'],
      freeTrial: json['free_trial'] != null
          ? FreeTrial.fromJson(json['free_trial'])
          : null,
    );
  }

  /// Converts the [AutoRecurring] instance into a JSON map.
  ///
  /// Any key with a `null` value is removed from the resulting map.
  Map<String, dynamic> toJson() {
    return {
      'frequency': frequency,
      'frequency_type': frequencyType,
      'repetitions': repetitions,
      'billing_day': billingDay,
      'billing_day_proportional': billingDayProportional,
      'start_date': startDate,
      'end_date': endDate,
      'currency_id': currencyId,
      'transaction_amount': transactionAmount,
      'free_trial': freeTrial?.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
