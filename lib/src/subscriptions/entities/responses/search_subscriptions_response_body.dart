import 'package:mercado_pago_flowlabs/src/core/client/client.dart'
    show ResponseBody;
import 'package:mercado_pago_flowlabs/src/models/models.dart';

/// Response payload for searching subscriptions (preapprovals).
///
/// The response includes:
/// - [paging]: An object containing pagination details (offset, limit, total).
/// - [results]: An array of subscription items. This will be empty if there are no results.
class SearchSubscriptionsResponseBody implements ResponseBody {
  /// Pagination details: offset, limit, and total number of items.
  final Paging paging;

  /// The page of subscription items.
  final List<SearchSubscription> results;

  SearchSubscriptionsResponseBody({
    required this.paging,
    required this.results,
  });

  /// Creates an instance from a JSON object.
  factory SearchSubscriptionsResponseBody.fromJson(Map<String, dynamic> json) {
    return SearchSubscriptionsResponseBody(
      paging: Paging.fromJson(json['paging']),
      results: (json['results'] as List)
          .map((item) => SearchSubscription.fromJson(item))
          .toList(),
    );
  }
}

/// Contains pagination details for the search results.
class Paging {
  /// The offset of the first item in the collection to return.
  final int offset;

  /// The maximum number of entries to return.
  final int limit;

  /// The total number of items in the collection.
  final int total;

  Paging({
    required this.offset,
    required this.limit,
    required this.total,
  });

  /// Creates an instance from a JSON object.
  factory Paging.fromJson(Map<String, dynamic> json) {
    return Paging(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
    );
  }
}

/// Represents a single subscription (preapproval) item.
class SearchSubscription {
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



  SearchSubscription({
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
  factory SearchSubscription.fromJson(Map<String, dynamic> json) {
    return SearchSubscription(
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

/// Summary information on subscription invoices and charges.
class Summarized {
  /// Total number of payments (quotas) that will be made.
  final int? quotas;

  /// Total number of quotas that have been charged.
  final int? chargedQuantity;

  /// Total amount collected to date.
  final num? chargedAmount;

  /// Number of quotas pending to be charged.
  final int? pendingChargeQuantity;

  /// Amount pending collection.
  final num? pendingChargeAmount;

  /// Date of the last charge (as a timestamp).
  final String? lastChargedDate;

  /// Amount charged in the last transaction.
  final num? lastChargedAmount;

  /// Numeric summary of the collection status.
  /// 
  /// Subscription collection status summary.
  /// green: All collections made.
  /// yellow: With collection problems. We are trying to collect an invoice.
  /// red: With pending collections. An invoice could not be collected.
  /// blank: Discounted collection.
  final String? semaphore;

  Summarized({
    this.quotas,
    this.chargedQuantity,
    this.chargedAmount,
    this.pendingChargeQuantity,
    this.pendingChargeAmount,
    this.lastChargedDate,
    this.lastChargedAmount,
    this.semaphore,
  });

  /// Creates an instance from a JSON object.
  factory Summarized.fromJson(Map<String, dynamic> json) {
    return Summarized(
      quotas: json['quotas'],
      chargedQuantity: json['charged_quantity'],
      chargedAmount: json['charged_amount'],
      pendingChargeQuantity: json['pending_charge_quantity'],
      pendingChargeAmount: json['pending_charge_amount'],
      lastChargedDate: json['last_charged_date'],
      lastChargedAmount: json['last_charged_amount'],
      semaphore: json['semaphore'],
    );
  }
}
