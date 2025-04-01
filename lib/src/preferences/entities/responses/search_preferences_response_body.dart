import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show ResponseBody;

/// Response payload for searching preferences.
///
/// For more information, visit:
/// https://www.mercadopago.com.ar/developers/en/reference/preferences/_checkout_preferences_search/get
class SearchPreferencesResponseBody implements ResponseBody {
  /// List of returned preferences.
  final List<SearchPreference> elements;

  /// Numeric field used to paginate the response.
  final int nextOffset;

  /// Total number of results.
  final int total;

  SearchPreferencesResponseBody({
    required this.elements,
    required this.nextOffset,
    required this.total,
  });

  /// Creates an instance from a JSON object.
  @override
  factory SearchPreferencesResponseBody.fromJson(Map<String, dynamic> json) {
    return SearchPreferencesResponseBody(
      elements: List<SearchPreference>.from(
          (json['elements'] as List).map((e) => SearchPreference.fromJson(e))),
      nextOffset: json['next_offset'],
      total: json['total'],
    );
  }
}

/// Represents a single preference element.
class SearchPreference {
  /// Preference ID.
  final String id;

  /// Unique ID used to identify the client.
  final String clientId;

  /// Unique ID used to identify the collector.
  final int collectorId;

  /// Registration date.
  final String dateCreated;

  /// Date indicating the start of the preference's validity period.
  final String? expirationDateFrom;

  /// Date indicating the end of the preference's validity period.
  final String? expirationDateTo;

  /// List of items associated with this preference.
  final List<dynamic> items;

  /// Marketplace origin of the payment.
  final String marketplace;

  /// Unique ID used to identify the site.
  final String siteId;

  /// Unique numeric ID to identify the sponsor.
  final int sponsorId;

  SearchPreference({
    required this.id,
    required this.clientId,
    required this.collectorId,
    required this.dateCreated,
    required this.expirationDateFrom,
    required this.expirationDateTo,
    required this.items,
    required this.marketplace,
    required this.siteId,
    required this.sponsorId,
  });

  /// Creates an instance from a JSON object.
  factory SearchPreference.fromJson(Map<String, dynamic> json) {
    return SearchPreference(
      id: json['id'],
      clientId: json['client_id'],
      collectorId: json['collector_id'],
      dateCreated: json['date_created'],
      expirationDateFrom: json['expiration_date_from'],
      expirationDateTo: json['expiration_date_to'],
      items: json['items'] as List,
      marketplace: json['marketplace'],
      siteId: json['site_id'],
      sponsorId: json['sponsor_id'],
    );
  }
}
