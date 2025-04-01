import 'package:mercado_pago_ducos/src/models/models.dart'
    show AutoRecurring, Summarized;

/// Represents a single subscription (preapproval) item.
///
/// This class encapsulates all the details related to a subscription,
/// including identifiers, customer information, payment configuration,
/// and status details.
class Subscription {
  /// Unique subscription identifier.
  final String id;

  /// Number of times the subscription was modified.
  final int? version;

  /// Unique numeric ID that identifies your application/integration.
  final int applicationId;

  /// Unique numeric ID that identifies your seller (collector).
  final int collectorId;

  /// Unique subscription plan identifier.
  ///
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
  ///
  /// Possible values:
  /// - pending: Preapproval without a payment method.
  /// - authorized: Preapproval with a valid payment method.
  /// - paused: Temporarily discontinued collection.
  /// - cancelled: Preapproval terminated.
  final String status;

  /// Creates an instance of [Subscription] with the provided details.
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

  /// Creates an instance of [Subscription] from a JSON map.
  ///
  /// The JSON map should include keys corresponding to the subscription details:
  /// - 'id': Unique subscription identifier.
  /// - 'version': Number of modifications.
  /// - 'application_id': Application/integration identifier.
  /// - 'collector_id': Seller (collector) identifier.
  /// - 'preapproval_plan_id': Subscription plan identifier (if applicable).
  /// - 'reason': Description shown to the subscriber.
  /// - 'external_reference': External system reference.
  /// - 'back_url': Redirection URL after checkout.
  /// - 'init_point': URL to initiate the checkout process.
  /// - 'auto_recurring': Recurring payment configuration.
  /// - 'first_invoice_offset': Days to collect the first invoice.
  /// - 'transaction_amount': Invoice charge amount.
  /// - 'payer_id': Unique customer identifier.
  /// - 'payer_first_name': Customer's first name.
  /// - 'payer_last_name': Customer's last name.
  /// - 'card_id': Identifier for the card used as payment.
  /// - 'payment_method_id': Configured payment method.
  /// - 'next_payment_date': Date of the next payment.
  /// - 'date_created': Subscription creation date.
  /// - 'last_modified': Last modification date.
  /// - 'summarized': Summary information for invoices and charges.
  /// - 'status': Current subscription status.
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
