/// Represents tracking values for conversion events and pixels.
///
/// This class encapsulates data related to conversion tracking, including the conversion ID,
/// conversion label, and Facebook Pixel ID.
class TrackValues {
  /// Conversion ID.
  final int? conversionId;

  /// Conversion label.
  final String? conversionLabel;

  /// Facebook Pixel ID.
  final String? pixelId;

  /// Creates an instance of [TrackValues] with the provided tracking data.
  TrackValues({
    this.conversionId,
    this.conversionLabel,
    this.pixelId,
  });

  /// Creates a [TrackValues] instance from a JSON map.
  ///
  /// The JSON map should include the following keys:
  /// - 'conversion_id': Identifier for the conversion.
  /// - 'conversion_label': Label describing the conversion.
  /// - 'pixel_id': Identifier for the Facebook Pixel.
  factory TrackValues.fromJson(Map<String, dynamic> json) {
    return TrackValues(
      conversionId: json['conversion_id'],
      conversionLabel: json['conversion_label'],
      pixelId: json['pixel_id'],
    );
  }

  /// Converts the [TrackValues] instance into a JSON map.
  ///
  /// The resulting map includes keys corresponding to the conversion ID, conversion label,
  /// and pixel ID. Any key with a `null` value is removed from the map.
  Map<String, dynamic> toJson() {
    return {
      "conversion_id": conversionId,
      "conversion_label": conversionLabel,
      "pixel_id": pixelId,
    }..removeWhere((key, value) => value == null);
  }
}
