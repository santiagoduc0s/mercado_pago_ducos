import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;

/// Request payload for searching payment preferences.
///
/// For more information, visit:
/// https://www.mercadopago.com.ar/developers/en/reference/preferences/_checkout_preferences_search/get
class SearchPreferencesRequestBody implements RequestBody {
  /// Unique numeric ID to identify the sponsor.
  ///
  /// This value is used to determine which platform the checkout flow was initiated from.
  final String? sponsorId;

  /// External reference that can be synchronized with your payment system.
  final String? externalReference;

  /// The site ID.
  ///
  /// Examples include:
  /// - MLA: Mercado Libre Argentina
  /// - MLB: Mercado Libre Brasil
  /// - MLC: Mercado Libre Chile
  /// - MLM: Mercado Libre México
  /// - MLU: Mercado Libre Uruguay
  /// - MCO: Mercado Libre Colombia
  /// - MPE: Mercado Libre Perú
  /// Default example: "MLB"
  final String? siteId;

  /// Marketplace ID.
  final String? marketplace;

  /// Creates an instance of [SearchPreferencesRequestBody] with the provided values.
  ///
  /// All parameters are optional.
  SearchPreferencesRequestBody({
    this.sponsorId,
    this.externalReference,
    this.siteId,
    this.marketplace,
  });

  /// Converts the [SearchPreferencesRequestBody] instance into a JSON map.
  ///
  /// The resulting map includes keys mapped to the corresponding fields.
  /// Any key with a `null` value is removed to ensure a clean JSON payload.
  @override
  Map<String, dynamic> toJson() {
    return {
      'sponsor_id': sponsorId,
      'external_reference': externalReference,
      'site_id': siteId,
      'marketplace': marketplace,
    }..removeWhere((key, value) => value == null);
  }
}
