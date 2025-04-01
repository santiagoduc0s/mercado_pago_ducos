import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;
import 'package:mercado_pago_ducos/src/models/models.dart';

/// Request payload for creating a payment preference.
///
/// For more information, visit:
/// https://www.mercadopago.com.ar/developers/en/reference/preferences/_checkout_preferences/post
class CreatePreferenceRequestBody implements RequestBody {
  /// List of items included in the preference.
  final List<Item> items;

  /// Buyer’s information, such as name, last name, e-mail, phone, identification,
  /// address, and registration date.
  final Payer? payer;

  /// Configuration related to payment methods, including excluded payment methods,
  /// excluded payment types, default payment method, and installments.
  final PaymentMethods? paymentMethods;

  /// Information about shipments, including shipping mode, cost, and receiver address.
  final Shipments? shipments;

  /// Return URLs to the seller's site.
  ///
  /// These URLs are used for automatic redirection ("auto_return") or through a
  /// 'Return to site' button, depending on the payment status.
  /// The URL must use the "https" protocol.
  final BackUrls? backUrls;

  /// URL to receive notifications of events related to the payment.
  ///
  /// The maximum allowed length is 248 characters, and the URL must use "https".
  final String? notificationUrl;

  /// A statement descriptor (up to 16 characters) that appears on the payer's credit card statement.
  final String? statementDescriptor;

  /// Additional information regarding the preference.
  final String? additionalInfo;

  /// Specifies the automatic redirection behavior after payment approval.
  ///
  /// Valid values:
  /// - "approved": Redirect only for approved credit card payments.
  /// - "all": Redirect for all approved credit card payments.
  final String? autoReturn;

  /// External reference to synchronize with your payment system.
  ///
  /// Important: This field must be a maximum of 64 characters and may only
  /// contain numbers, letters, hyphens (-), and underscores (_). Special characters
  /// such as ([ ], (), '', @) are not allowed.
  final String? externalReference;

  /// Indicates if the preference should expire.
  final bool? expires;

  /// Start date of the preference's validity period.
  ///
  /// The date must be in "yyyy-MM-dd'T'HH:mm:ssz" format.
  /// Example: "2022-11-17T09:37:52.000-04:00".
  final String? expirationDateFrom;

  /// End date of the preference's validity period.
  ///
  /// The date must be in "yyyy-MM-dd'T'HH:mm:ssz" format.
  /// Example: "2022-11-17T09:37:52.000-04:00".
  final String? expirationDateTo;

  /// Origin of the payment.
  ///
  /// This is an alphanumeric field whose default value is "NONE". If the collector
  /// has their own marketplace, this field is used to send the credentials to identify it.
  final String? marketplace;

  /// Marketplace's fee charged by the application owner.
  ///
  /// This is a fixed amount in local currency and can only be provided if a valid
  /// marketplace is defined.
  final int? marketplaceFee;

  /// Differential pricing configuration for the preference.
  ///
  /// The seller can define custom payment methods and installments using this parameter.
  final DifferentialPricing? differentialPricing;

  /// List of tracking configurations to be executed during the checkout flow.
  ///
  /// Currently, supported tracks include Google Ads and Facebook pixels.
  final List<Track>? tracks;

  /// Additional metadata as valid JSON that can be added to the payment.
  final Map<String, dynamic>? metadata;

  /// Creates an instance of [CreatePreferenceRequestBody] with the provided values.
  ///
  /// All fields are optional except [items], which is required.
  CreatePreferenceRequestBody({
    required this.items,
    this.payer,
    this.paymentMethods,
    this.shipments,
    this.backUrls,
    this.notificationUrl,
    this.statementDescriptor,
    this.additionalInfo,
    this.autoReturn,
    this.externalReference,
    this.expires,
    this.expirationDateFrom,
    this.expirationDateTo,
    this.marketplace,
    this.marketplaceFee,
    this.differentialPricing,
    this.tracks,
    this.metadata,
  });

  /// Converts the [CreatePreferenceRequestBody] instance into a JSON map.
  ///
  /// This method serializes all properties into key/value pairs.
  /// Any key with a `null` value is removed from the resulting map.
  @override
  Map<String, dynamic> toJson() {
    return {
      // Convert the list of items to a list of JSON maps.
      "items": items.map((item) => item.toJson()).toList(),
      // Optional fields: include them only if they are not null.
      "payer": payer?.toJson(),
      "payment_methods": paymentMethods?.toJson(),
      "shipments": shipments?.toJson(),
      "back_urls": backUrls?.toJson(),
      "notification_url": notificationUrl,
      "statement_descriptor": statementDescriptor,
      "additional_info": additionalInfo,
      "auto_return": autoReturn,
      "external_reference": externalReference,
      "expires": expires,
      "expiration_date_from": expirationDateFrom,
      "expiration_date_to": expirationDateTo,
      "marketplace": marketplace,
      "marketplace_fee": marketplaceFee,
      "differential_pricing": differentialPricing?.toJson(),
      "tracks": tracks?.map((track) => track.toJson()).toList(),
      "metadata": metadata,
    }..removeWhere((key, value) => value == null);
  }
}
