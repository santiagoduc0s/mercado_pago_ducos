import 'package:mercado_pago_ducos/src/models/models.dart'
    show ExcludedPaymentMethod, ExcludedPaymentType;

class PaymentMethods {
  /// Payment methods excluded from the payment process (except
  /// account_money and wallet, which is always allowed). The
  /// payment methods included here will not be available at checkout.
  final List<ExcludedPaymentMethod>? excludedPaymentMethods;

  /// Payment types excluded from the payment process. The payment
  /// types included here will not be available at checkout.
  final List<ExcludedPaymentType>? excludedPaymentTypes;

  /// Suggested payment method. The user will initiate the checkout
  /// this this payment method already selected. It is considered
  /// suggested because Checkouts follow different logics in order
  /// to select the best payment method for a specific transaction,
  /// and this property is the option with the least relevance.
  /// Example: "amex"
  final String? defaultPaymentMethodId;

  /// Maximum number of credit card installments to be accepted.
  /// Example: 6
  final int? installments;

  /// Preferred number of credit card installments.
  /// Example: 3
  final int? defaultInstallments;

  PaymentMethods({
    this.excludedPaymentMethods,
    this.excludedPaymentTypes,
    this.defaultPaymentMethodId,
    this.installments,
    this.defaultInstallments,
  });

  factory PaymentMethods.fromJson(Map<String, dynamic> json) {
    return PaymentMethods(
      excludedPaymentMethods: json['excluded_payment_methods'] != null
          ? (json['excluded_payment_methods'] as List)
              .map((e) => ExcludedPaymentMethod.fromJson(e))
              .toList()
          : null,
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
