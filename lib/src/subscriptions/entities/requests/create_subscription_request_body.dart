import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;
import 'package:mercado_pago_ducos/src/models/models.dart' show AutoRecurring;

/// Request payload for creating a subscription.
///
/// For more details, please refer to the Mercado Pago documentation.
class CreateSubscriptionRequestBody implements RequestBody {
  /// Unique subscription plan identifier.
  /// Optional: Only used when the subscription is created from a plan.
  final String? preapprovalPlanId;

  /// A short description shown during checkout and notifications.
  ///
  /// Required for subscriptions without a plan.
  final String reason;

  /// External reference to synchronize with your system.
  ///
  /// Required for subscriptions without a plan.
  final String? externalReference;

  /// Email linked to the subscriber.
  ///
  /// This field is required.
  final String payerEmail;

  /// Token generated from the payment form capturing card data.
  ///
  /// Optional: Only needed if a card token is used.
  final String? cardTokenId;

  /// Recurrence configuration for the subscription.
  ///
  /// This field is required.
  final AutoRecurring autoRecurring;

  /// URL to redirect the user after a successful payment.
  ///
  /// Required for subscriptions without a plan.
  final String backUrl;

  /// Status of the subscription.
  ///
  /// Allowed values: "pending", "authorized".
  final String? status;

  /// Creates an instance of [CreateSubscriptionRequestBody].
  ///
  /// [reason], [payerEmail], [autoRecurring], and [backUrl] are required.
  CreateSubscriptionRequestBody({
    this.preapprovalPlanId,
    required this.reason,
    this.externalReference,
    required this.payerEmail,
    this.cardTokenId,
    required this.autoRecurring,
    required this.backUrl,
    this.status,
  });

  /// Converts the [CreateSubscriptionRequestBody] instance into a JSON map.
  ///
  /// Any key with a `null` value is removed from the resulting map.
  @override
  Map<String, dynamic> toJson() {
    return {
      "preapproval_plan_id": preapprovalPlanId,
      "reason": reason,
      "external_reference": externalReference,
      "payer_email": payerEmail,
      "card_token_id": cardTokenId,
      // Serialize the AutoRecurring configuration.
      "auto_recurring": autoRecurring.toJson(),
      "back_url": backUrl,
      "status": status,
    }..removeWhere((key, value) => value == null);
  }
}
