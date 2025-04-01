import 'package:mercado_pago_ducos/src/models/models.dart';

/// Configuration data for recurring payments.
///
/// This class defines parameters that control the recurring billing cycle,
/// such as frequency, type, and optional fields like billing day and free trial.
class AutoRecurring {
  /// Frequency value that, along with [frequencyType], defines the invoice cycle.
  final int frequency;

  /// Frequency type, e.g. "days" or "months".
  final String frequencyType;

  /// Optional: Number of times the payment should be repeated.
  final int? repetitions;

  /// Optional: Specific day of the month for billing.
  final int? billingDay;

  /// Optional: Determines if the billing day should be proportional.
  final bool? billingDayProportional;

  /// Optional: Date from which the subscription will be active, formatted as a string.
  final String? startDate;

  /// Optional: Date until which the subscription will be active, formatted as a string.
  final String? endDate;

  /// ID of the currency used in the payment.
  final String currencyId;

  /// Amount to charge on each invoice.
  final num transactionAmount;

  /// Optional: Configuration for a free trial period.
  final FreeTrial? freeTrial;

  /// Creates an instance of [AutoRecurring].
  ///
  /// Required parameters are [frequency], [frequencyType], [currencyId],
  /// and [transactionAmount]. Other parameters are optional.
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
  ///
  /// The JSON should include keys that correspond to the properties of the class.
  /// If a key is missing or the value is null, the corresponding field will be null.
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
      // Check if 'free_trial' key exists and create a FreeTrial instance if it does.
      freeTrial: json['free_trial'] != null
          ? FreeTrial.fromJson(json['free_trial'])
          : null,
    );
  }

  /// Converts the [AutoRecurring] instance into a JSON map.
  ///
  /// This method returns a map of key/value pairs representing the instance.
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
