import 'package:mercado_pago_ducos/src/models/models.dart' show TrackValues;

/// Represents tracking configuration for analytics tools.
///
/// This class supports different tracking types, such as Google Ads and Facebook Pixel.
/// It encapsulates the track type and the associated configuration values.
class Track {
  /// Track type.
  ///
  /// Specifies which tracking tool the values belong to. For example:
  /// - 'google_ad': For Google Ads Conversion Tracking (requires conversion_id and conversion_label).
  /// - 'facebook_ad': For Facebook Pixel (requires pixel_id).
  final String? type;

  /// Configuration values based on the track type.
  ///
  /// For tracks of type 'google_ad', configure the values for 'conversion_id' and 'conversion_label'.
  /// For tracks of type 'facebook_ad', configure the value for 'pixel_id'.
  final TrackValues? values;

  /// Creates an instance of [Track] with the given [type] and [values].
  Track({
    this.type,
    this.values,
  });

  /// Creates a [Track] instance from a JSON map.
  ///
  /// The JSON map should include:
  /// - 'type': The track type.
  /// - 'values': A JSON map representing the configuration values, which will be used to
  ///   create a [TrackValues] instance if provided.
  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      type: json['type'],
      values:
          json['values'] != null ? TrackValues.fromJson(json['values']) : null,
    );
  }

  /// Converts the [Track] instance into a JSON map.
  ///
  /// The returned map includes:
  /// - 'type': The track type.
  /// - 'values': The configuration values as a JSON map.
  ///
  /// **Note:** The non-null assertion (`!`) is used for [values] here, so make sure it is not null.
  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "values": values!.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
