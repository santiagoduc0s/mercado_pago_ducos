import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show ResponseBody;
import 'package:mercado_pago_ducos/src/models/models.dart'
    show AutoRecurring, FreeTrial;

/// Response wrapper for creating a subscription.
///
/// For more information, please refer to the Mercado Pago documentation.
class CreateSubscriptionResponseBody implements ResponseBody {
  /// Unique subscription identifier.
  final String id;

  /// How many times the subscription was modified.
  final int? version;

  /// Unique ID that identifies your application/integration.
  final int applicationId;

  /// Unique ID that identifies your user as a seller.
  final int collectorId;

  /// Unique plan identifier.
  final String? preapprovalPlanId;

  /// Short description shown during checkout and in notifications.
  /// Only required for subscriptions without a plan.
  final String? reason;

  /// External reference to synchronize with your system.
  final String externalReference;

  /// Successful return URL.
  final String backUrl;

  /// URL to checkout to add or modify payment method.
  final String initPoint;

  /// Configuration data for recurrence.
  final AutoRecurring autoRecurring;

  /// Free trial data, if provided.
  final FreeTrial? freeTrial;

  /// Unique customer identifier (derived from the subscription email).
  final int payerId;

  /// Unique identifier to retrieve data from the card used as a payment method.
  final int? cardId;

  /// Payment method configured.
  final int? paymentMethodId;

  /// Date of the next payment debit.
  final String nextPaymentDate;

  /// Subscription creation date.
  final String dateCreated;

  /// Date of the last modification.
  final String lastModified;

  /// Subscription status: "pending" (without payment method) or "authorized" (with a payment method).
  final String status;

  /// Creates an instance of [CreateSubscriptionResponseBody] with the provided values.
  CreateSubscriptionResponseBody({
    required this.id,
    this.version,
    required this.applicationId,
    required this.collectorId,
    this.preapprovalPlanId,
    this.reason,
    required this.externalReference,
    required this.backUrl,
    required this.initPoint,
    required this.autoRecurring,
    this.freeTrial,
    required this.payerId,
    this.cardId,
    this.paymentMethodId,
    required this.nextPaymentDate,
    required this.dateCreated,
    required this.lastModified,
    required this.status,
  });

  /// Creates a [CreateSubscriptionResponseBody] from a JSON map.
  ///
  /// The [json] parameter must contain all necessary keys corresponding to the
  /// fields of this class. This factory constructor parses the JSON and maps
  /// its values to the respective fields.
  factory CreateSubscriptionResponseBody.fromJson(Map<String, dynamic> json) {
    return CreateSubscriptionResponseBody(
      id: json['id'],
      version: json['version'],
      applicationId: json['application_id'],
      collectorId: json['collector_id'],
      preapprovalPlanId: json['preapproval_plan_id'],
      reason: json['reason'],
      externalReference: json['external_reference'],
      backUrl: json['back_url'],
      initPoint: json['init_point'],
      // Parse the auto recurring configuration using its fromJson method.
      autoRecurring: AutoRecurring.fromJson(json['auto_recurring']),
      // Parse freeTrial if it exists, otherwise leave it null.
      freeTrial: json['free_trial'] != null
          ? FreeTrial.fromJson(json['free_trial'])
          : null,
      payerId: json['payer_id'],
      cardId: json['card_id'],
      paymentMethodId: json['payment_method_id'],
      nextPaymentDate: json['next_payment_date'],
      dateCreated: json['date_created'],
      lastModified: json['last_modified'],
      status: json['status'],
    );
  }
}
