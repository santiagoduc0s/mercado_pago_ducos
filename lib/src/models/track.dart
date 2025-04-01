import 'package:mercado_pago_ducos/src/models/models.dart' show TrackValues;

class Track {
  /// Track type. Specifies which tool the values belong to.
  /// google_ad: Allows configurations for GTM's Google Ads
  /// Conversion Tracking tag. Necessary values as conversion_id
  /// and conversion_label.
  /// facebook_ad: Allows configurations for Facebook Pixel.
  /// Necessary values as pixel_id.
  final String? type;

  /// Configuration values according to the type of track.
  /// For tracks of type 'google_ad,' configure the values
  /// for 'conversion_id' and 'conversion_label'. For tracks
  /// of type 'facebook_ad,' configure the value for 'pixel_id'
  final TrackValues? values;

  Track({
    this.type,
    this.values,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      type: json['type'],
      values:
          json['values'] != null ? TrackValues.fromJson(json['values']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "values": values!.toJson(),
    }..removeWhere((key, value) => value == null);
  }
}
