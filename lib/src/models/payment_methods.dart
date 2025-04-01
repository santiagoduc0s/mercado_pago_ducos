import 'package:mercado_pago_ducos/src/models/models.dart'
    show ExcludedPaymentMethod, ExcludedPaymentType;

/// Model for configuring payment method preferences.
///
/// This class allows you to exclude specific payment methods or types,
/// suggest a default payment method, and specify installment preferences.
class PaymentMethods {
  /// Payment methods to be excluded from the checkout process.
  ///
  /// Note: 'account_money' and 'wallet' are always allowed.
  final List<ExcludedPaymentMethod>? excludedPaymentMethods;

  /// Payment types to be excluded from the checkout process.
  final List<ExcludedPaymentType>? excludedPaymentTypes;

  /// Suggested default payment method.
  ///
  /// This value pre-selects a payment method during checkout.
  /// Example: "amex"
  final String? defaultPaymentMethodId;

  /// Maximum number of credit card installments accepted.
  ///
  /// Example: 6
  final int? installments;

  /// Preferred (default) number of credit card installments.
  ///
  /// Example: 3
  final int? defaultInstallments;

  /// Creates an instance of [PaymentMethods] with the given parameters.
  PaymentMethods({
    this.excludedPaymentMethods,
    this.excludedPaymentTypes,
    this.defaultPaymentMethodId,
    this.installments,
    this.defaultInstallments,
  });

  /// Creates a [PaymentMethods] instance from a JSON map.
  ///
  /// The JSON map should include keys corresponding to the properties:
  /// - 'excluded_payment_methods': List of payment methods to exclude.
  /// - 'excluded_payment_types': List of payment types to exclude.
  /// - 'default_payment_method_id': Suggested default payment method.
  /// - 'installments': Maximum installments allowed.
  /// - 'default_installments': Preferred number of installments.
  factory PaymentMethods.fromJson(Map<String, dynamic> json) {
    return PaymentMethods(
      // Map each JSON entry to an ExcludedPaymentMethod instance.
      excludedPaymentMethods: json['excluded_payment_methods'] != null
          ? (json['excluded_payment_methods'] as List)
              .map((e) => ExcludedPaymentMethod.fromJson(e))
              .toList()
          : null,
      // Map each JSON entry to an ExcludedPaymentType instance.
      excludedPaymentTypes: json['excluded_payment_types'] != null
          ? (json['excluded_payment_types'] as List)
              .map((e) => ExcludedPaymentType.fromJson(e))
              .toList()
          : null,
      defaultPaymentMethodId: json['default_payment_method_id'],
      installments: json['installments'],
      defaultInstallments: json['default_installments'],
    );
  }

  /// Converts the [PaymentMethods] instance into a JSON map.
  ///
  /// The returned map includes:
  /// - 'excluded_payment_methods' as a list of JSON maps.
  /// - 'excluded_payment_types' as a list of JSON maps.
  /// - 'default_payment_method_id', 'installments', and 'default_installments'.
  ///
  /// **Note:** Non-null assertions (`!`) are used for list properties,
  /// so ensure these properties are not null when calling [toJson].
  Map<String, dynamic> toJson() {
    return {
      "excluded_payment_methods":
          excludedPaymentMethods!.map((e) => e.toJson()).toList(),
      "excluded_payment_types":
          excludedPaymentTypes!.map((e) => e.toJson()).toList(),
      "default_payment_method_id": defaultPaymentMethodId,
      "installments": installments,
      "default_installments": defaultInstallments,
    }..removeWhere((key, value) => value == null);
  }
}
