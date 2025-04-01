import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;

/// Request payload for creating a payment preference.
///
/// For more information, visit:
/// https://www.mercadopago.com.ar/developers/en/reference/preferences/_checkout_preferences_search/get
class SearchPreferencesRequestBody implements RequestBody {
  /// Unique numeric ID to identify the sponsor.
  /// It is used to identify what platform the checkout flow was initiated in.
  final String? sponsorId;

  /// Reference you can synchronize with your payment system.
  final String? externalReference;

  /// The site id.
  /// Examples:
  /// MLA: Mercado Libre Argentina
  /// MLB: Mercado Libre Brasil
  /// MLC: Mercado Libre Chile
  /// MLM: Mercado Libre México
  /// MLU: Mercado Libre Uruguay
  /// MCO: Mercado Libre Colombia
  /// MPE: Mercado Libre Perú
  /// Default example: "MLB"
  final String? siteId;

  /// Marketplace ID.
  final String? marketplace;

  SearchPreferencesRequestBody({
    this.sponsorId,
    this.externalReference,
    this.siteId,
    this.marketplace,
  });

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
