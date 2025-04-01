import 'package:mercado_pago_ducos/src/models/models.dart'
    show AutoRecurring, Summarized;

/// Represents a single subscription (preapproval) item.
class Subscription {
  /// Unique subscription identifier.
  final String id;

  /// Number of times the subscription was modified.
  final int? version;

  /// Unique ID that identifies your application/integration.
  final int applicationId;

  /// Unique ID that identifies the seller (collector).
  final int collectorId;

  /// Unique subscription plan identifier.
  /// Only available when the subscription is created from a plan.
  final String? preapprovalPlanId;

  /// Short description shown to the subscriber during checkout and in notifications.
  final String? reason;

  /// External reference to synchronize with your system.
  final String? externalReference;

  /// URL to which the customer is redirected after a successful checkout.
  final String backUrl;

  /// URL to initiate the checkout process for adding or modifying the payment method.
  final String? initPoint;

  /// Configuration data for recurring payments.
  final AutoRecurring autoRecurring;

  /// Number of days to collect the first invoice.
  final num? firstInvoiceOffset;

  /// Amount to be charged on each invoice.
  final num? transactionAmount;

  /// Unique customer identifier (derived from the email used during subscription creation).
  final int payerId;

  /// Customer's first name.
  final String payerFirstName;

  /// Customer's last name.
  final String payerLastName;

  /// Unique identifier to retrieve data from the card used as payment method.
  final int? cardId;

  /// Payment method configured.
  final String? paymentMethodId;

  /// Date of the next payment debit.
  final String? nextPaymentDate;

  /// Subscription creation date.
  final String dateCreated;

  /// Date of last modification.
  final String lastModified;

  /// Summary information on subscription invoices and charges.
  final Summarized summarized;

  /// Current status of the subscription.
  /// Possible values:
  /// - pending: Preapproval without a payment method.
  /// - authorized: Preapproval with a valid payment method.
  /// - paused: Temporarily discontinued collection.
  /// - cancelled: Preapproval terminated.
  final String status;

  Subscription({
    required this.id,
    this.version,
    required this.applicationId,
    required this.collectorId,
    this.preapprovalPlanId,
    this.reason,
    this.externalReference,
    required this.backUrl,
    this.initPoint,
    required this.autoRecurring,
    this.firstInvoiceOffset,
    this.transactionAmount,
    required this.payerId,
    required this.payerFirstName,
    required this.payerLastName,
    this.cardId,
    this.paymentMethodId,
    this.nextPaymentDate,
    required this.dateCreated,
    required this.lastModified,
    required this.summarized,
    required this.status,
  });

  /// Creates an instance from a JSON object.
  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      id: json['id'],
      version: json['version'],
      applicationId: json['application_id'],
      collectorId: json['collector_id'],
      preapprovalPlanId: json['preapproval_plan_id'],
      reason: json['reason'],
      externalReference: json['external_reference'],
      backUrl: json['back_url'],
      initPoint: json['init_point'],
      autoRecurring: AutoRecurring.fromJson(json['auto_recurring']),
      firstInvoiceOffset: json['first_invoice_offset'],
      transactionAmount: json['transaction_amount'],
      payerId: json['payer_id'],
      payerFirstName: json['payer_first_name'],
      payerLastName: json['payer_last_name'],
      cardId: json['card_id'],
      paymentMethodId: json['payment_method_id'],
      nextPaymentDate: json['next_payment_date'],
      dateCreated: json['date_created'],
      lastModified: json['last_modified'],
      summarized: Summarized.fromJson(json['summarized']),
      status: json['status'],
    );
  }
}
