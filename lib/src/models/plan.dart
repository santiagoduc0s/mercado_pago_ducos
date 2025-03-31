import 'package:mercado_pago_flowlabs/src/models/models.dart';

/// Model representing a subscription plan.
class Plan {
  /// Unique identifier for the subscription plan.
  final String id;

  /// Unique numeric ID that identifies your application/integration.
  final int applicationId;

  /// Unique numeric ID that identifies your seller user.
  final int collectorId;

  /// A brief description shown to the subscriber during checkout and notifications.
  final String reason;

  /// Information about the recurrence configuration.
  final AutoRecurring autoRecurring;

  /// Amount that will be charged on each invoice.
  final int? transactionAmount;

  /// Currency identifier used in the payment (e.g., ARS, BRL, CLP).
  final String? currencyId;

  /// Allowed payment methods configuration.
  final PaymentMethodsAllowed? paymentMethodsAllowed;

  /// List of payment methods permitted in the checkout.
  final List<PaymentMethod>? paymentMethods;

  /// URL to which the client will be redirected after a successful checkout.
  final String backUrl;

  /// External reference to sync with your system.
  final String externalReference;

  /// URL to start the subscription flow.
  final String initPoint;

  /// Date when the plan was created.
  final String dateCreated;

  /// Date when the plan was last modified.
  final String lastModified;

  /// Number of clients subscribed to the plan.
  final int subscribed;

  /// Current status of the plan (e.g., active, cancelled).
  final String status;

  Plan({
    required this.id,
    required this.applicationId,
    required this.collectorId,
    required this.reason,
    required this.autoRecurring,
    this.transactionAmount,
    this.currencyId,
    this.paymentMethodsAllowed,
    this.paymentMethods,
    required this.backUrl,
    required this.externalReference,
    required this.initPoint,
    required this.dateCreated,
    required this.lastModified,
    required this.subscribed,
    required this.status,
  });

  /// Creates an instance from a JSON map.
  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      applicationId: json['application_id'],
      collectorId: json['collector_id'],
      reason: json['reason'],
      autoRecurring: AutoRecurring.fromJson(
          json['auto_recurring'] as Map<String, dynamic>),
      transactionAmount: json['transaction_amount'],
      currencyId: json['currency_id'],
      paymentMethodsAllowed: json['payment_methods_allowed'] != null
          ? PaymentMethodsAllowed.fromJson(
              json['payment_methods_allowed'] as Map<String, dynamic>)
          : null,
      paymentMethods: json['payment_methods']
          ?.map((item) => PaymentMethod.fromJson(item as Map<String, dynamic>)),
      backUrl: json['back_url'],
      externalReference: json['external_reference'],
      initPoint: json['init_point'],
      dateCreated: json['date_created'],
      lastModified: json['last_modified'],
      subscribed: json['subscribed'],
      status: json['status'],
    );
  }

  /// Converts the plan instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'application_id': applicationId,
      'collector_id': collectorId,
      'reason': reason,
      'auto_recurring': autoRecurring.toJson(),
      'transaction_amount': transactionAmount,
      'currency_id': currencyId,
      'payment_methods_allowed': paymentMethodsAllowed?.toJson(),
      'payment_methods': paymentMethods?.map((pm) => pm.toJson()).toList(),
      'back_url': backUrl,
      'external_reference': externalReference,
      'init_point': initPoint,
      'date_created': dateCreated,
      'last_modified': lastModified,
      'subscribed': subscribed,
      'status': status,
    };
  }
}
