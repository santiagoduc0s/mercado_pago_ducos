import 'package:mercado_pago_ducos/src/models/models.dart';
import 'package:mercado_pago_ducos/src/core/client/client.dart' show ResponseBody;

/// Response wrapper for creating a payment preference.
///
/// For more information go to: 
/// https://www.mercadopago.com.ar/developers/en/reference/preferences/_checkout_preferences/post
class GetPreferenceResponseBody implements ResponseBody {
  /// Unique ID used to identify the collector.
  /// It is the same as the Cust ID.
  final int collectorId;

  /// Operation data_type.
  /// Possible values:
  /// - regular_payment: Normal payment.
  /// - money_transfer: Money request.
  final String operationType;

  /// List of items included in the preference.
  final List<Item> items;

  /// Information about the payer including name, email, phone,
  /// personal identification, address, and registration date.
  final Payer payer;

  /// Return URLs to the seller's site.
  /// This may be used for auto-return after payment or via a 'Return to site' button.
  /// The URL must use the "https" protocol.
  final BackUrls backUrls;

  /// Determines the automatic redirection behavior after payment approval.
  /// Valid values:
  /// - approved: Redirect only for approved credit card payments.
  /// - all: Redirect for all approved credit card payments.
  final String autoReturn;

  /// Configuration for payment methods such as excluded payment types,
  /// default payment method, and installments.
  final PaymentMethods? paymentMethods;

  /// If TRUE, payments can only be approved or rejected.
  /// If FALSE, payments can also be in an "in_process" state.
  final bool binaryMode;

  /// Unique client ID obtained from the credentials used to create the preference.
  final String clientId;

  /// Origin of the payment.
  /// This alphanumeric field defaults to "NONE" and is used to identify a collector's own marketplace.
  final String marketplace;

  /// Fee charged by the marketplace (fixed amount in local currency).
  /// This parameter is only valid if a marketplace is defined.
  final int marketplaceFee;

  /// Information about the shipment.
  final Shipments shipments;

  /// URL to receive notifications of events related to the payment.
  /// The URL must use the "https" protocol and its length is limited to 248 characters.
  final String? notificationUrl;

  /// A statement descriptor (up to 16 characters) that appears on the payer's credit card statement.
  final String? statementDescriptor;

  /// External reference used to synchronize with your payment system.
  final String externalReference;

  /// Additional information regarding the preference.
  final String additionalInfo;

  /// Boolean indicating whether the preference expires.
  final bool expires;

  /// Start date of the preference's validity period in "yyyy-MM-dd'T'HH:mm:ssz" format.
  /// For example: "2022-11-17T09:37:52.000-04:00".
  final String? expirationDateFrom;

  /// End date of the preference's validity period in "yyyy-MM-dd'T'HH:mm:ssz" format.
  /// For example: "2022-11-17T09:37:52.000-04:00".
  final String? expirationDateTo;

  /// Date when the preference was created.
  /// For example: "2022-11-17T09:37:52.000-04:00".
  final String dateCreated;

  /// Autogenerated unique ID that identifies the preference.
  /// For example: "036151801-2484cd71-7140-4c51-985a-d4cfcf133baf".
  final String id;

  /// Automatically generated URL to open the Checkout.
  final String initPoint;

  /// Sandbox URL to open the Checkout.
  /// Note: This parameter is recommended only for integration testing.
  final String sandboxInitPoint;

  /// Valid JSON containing additional attributes to be added to the payment.
  final Map<String, dynamic> metadata;

  /// Creates an instance of [CreatePreferenceResponseBody] with all required fields.
  GetPreferenceResponseBody({
    required this.collectorId,
    required this.operationType,
    required this.items,
    required this.payer,
    required this.backUrls,
    required this.autoReturn,
    required this.paymentMethods,
    required this.binaryMode,
    required this.clientId,
    required this.marketplace,
    required this.marketplaceFee,
    required this.shipments,
    this.notificationUrl,
    this.statementDescriptor,
    required this.externalReference,
    required this.additionalInfo,
    required this.expires,
    this.expirationDateFrom,
    this.expirationDateTo,
    required this.dateCreated,
    required this.id,
    required this.initPoint,
    required this.sandboxInitPoint,
    required this.metadata,
  });

  /// Creates a [CreatePreferenceResponseBody] from a JSON map.
  ///
  /// The [json] parameter must contain all necessary keys corresponding to the
  /// fields of this class. This factory constructor parses the JSON and maps
  /// its values to the respective fields.
  factory GetPreferenceResponseBody.fromJson(Map<String, dynamic> json) {
    return GetPreferenceResponseBody(
      collectorId: json['collector_id'],
      operationType: json['operation_type'],
      items: (json['items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
      payer: Payer.fromJson(json['payer']),
      backUrls: BackUrls.fromJson(json['back_urls']),
      autoReturn: json['auto_return'],
      paymentMethods: json['payment_methods'] != null
          ? PaymentMethods.fromJson(json['payment_methods'])
          : null,
      binaryMode: json['binary_mode'],
      clientId: json['client_id'],
      marketplace: json['marketplace'],
      marketplaceFee: json['marketplace_fee'],
      shipments: Shipments.fromJson(json['shipments']),
      notificationUrl: json['notification_url'],
      statementDescriptor: json['statement_descriptor'],
      externalReference: json['external_reference'],
      additionalInfo: json['additional_info'],
      expires: json['expires'],
      expirationDateFrom: json['expiration_date_from'],
      expirationDateTo: json['expiration_date_to'],
      dateCreated: json['date_created'],
      id: json['id'],
      initPoint: json['init_point'],
      sandboxInitPoint: json['sandbox_init_point'],
      metadata: Map<String, dynamic>.from(json['metadata']),
    );
  }
}
