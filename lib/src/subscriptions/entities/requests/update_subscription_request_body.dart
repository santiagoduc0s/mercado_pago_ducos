import 'package:mercado_pago_ducos/src/core/client/client.dart' show RequestBody;
import 'package:mercado_pago_ducos/src/models/models.dart' show AutoRecurring;

/// Request payload for updating a subscription.
///
/// For more details, please refer to the Mercado Pago documentation.
class UpdateSubscriptionRequestBody implements RequestBody {
  /// Unique subscription identifier.
  final String id;

  /// A short description shown during checkout and notifications.
  ///
  /// This field is required for subscriptions without a plan.
  final String? reason;

  /// External reference to synchronize with your payment system.
  ///
  /// Required for subscriptions without a plan.
  final String? externalReference;

  /// Token generated from the payment form capturing card data.
  final String? cardTokenId;

  /// Unique identifier to recover details of the card.
  final String? cardTokenIdSecondary;

  /// Identifier of the secondary payment method.
  ///
  /// Example: "visa".
  final String? paymentMethodIdSecondary;

  /// Recurrence configuration for the subscription.
  final AutoRecurring? autoRecurring;

  /// URL to redirect the user after a successful payment.
  ///
  /// Required for subscriptions without a plan.
  final String? backUrl;

  /// Status of the subscription.
  ///
  /// Allowed values:
  /// - "pending":    Preapproval without a payment method.
  /// - "authorized": Preapproval with a valid payment method.
  /// - "paused":     Preapproval with temporarily discontinued collection.
  /// - "cancelled":  Preapproval terminated (irreversible state).
  final String? status;

  /// Creates an instance of [UpdateSubscriptionRequestBody].
  ///
  /// The [id] parameter is required. Other fields are optional based on your use case.
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
  ///
  /// Any key with a `null` value is removed from the resulting map.
  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "reason": reason,
      "external_reference": externalReference,
      "card_token_id": cardTokenId,
      "card_token_id_secondary": cardTokenIdSecondary,
      "payment_method_id_secondary": paymentMethodIdSecondary,
      // Serialize autoRecurring if provided.
      "auto_recurring": autoRecurring?.toJson(),
      "back_url": backUrl,
      "status": status,
    }..removeWhere((key, value) => value == null);
  }
}
