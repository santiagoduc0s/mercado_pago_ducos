import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;
import 'package:mercado_pago_ducos/src/models/models.dart'
    show AutoRecurring;

/// Request payload for creating a subscription.
///
/// For more details, please refer to the Mercado Pago documentation.
class UpdateSubscriptionRequestBody implements RequestBody {
  /// Unique subscription identifier.
  final String id;

  /// A short description shown during checkout and notifications.
  /// Required for subscriptions without a plan.
  final String? reason;

  /// External reference to sync with your system.
  /// Required for subscriptions without a plan.
  final String? externalReference;

  /// Token generated from the payment form capturing card data.
  final String? cardTokenId;

  /// Unique identifier to recover details of the card
  final String? cardTokenIdSecondary;

  /// Identifier of the secondary payment method.
  ///
  /// Example: "visa"
  final String? paymentMethodIdSecondary;

  /// Recurrence configuration for the subscription.
  final AutoRecurring? autoRecurring;

  /// URL to redirect the user after a successful payment.
  /// Required for subscriptions without a plan.
  final String? backUrl;

  /// Status of the subscription.
  ///
  /// "pending":    Preapproval without a payment method
  /// "authorized": Preapproval with a valid payment method.
  /// "paused":     Preapproval with temporally discontinued collection of payments.
  /// "cancelled":  Preapproval terminated. This is an irreversible state.
  final String? status;

  /// Creates an instance of [UpdateSubscriptionRequestBody].
  UpdateSubscriptionRequestBody({
    required this.id,
    this.reason,
    this.externalReference,
    this.cardTokenId,
    this.cardTokenIdSecondary,
    this.paymentMethodIdSecondary,
    this.autoRecurring,
    this.backUrl,
    this.status,
  });

  /// Converts the [UpdateSubscriptionRequestBody] instance into a JSON map.
  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "reason": reason,
      "external_reference": externalReference,
      "card_token_id": cardTokenId,
      "card_token_id_secondary": cardTokenIdSecondary,
      "payment_method_id_secondary": paymentMethodIdSecondary,
      "auto_recurring": autoRecurring?.toJson(),
      "back_url": backUrl,
      "status": status,
    }..removeWhere((key, value) => value == null);
  }
}
