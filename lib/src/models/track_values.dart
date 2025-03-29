class TrackValues {
  /// Conversion ID.
  final int? conversionId;

  /// Conversion label.
  final String? conversionLabel;

  /// Facebook Pixel.
  final String? pixelId;

  TrackValues({
    this.conversionId,
    this.conversionLabel,
    this.pixelId,
  });

  factory TrackValues.fromJson(Map<String, dynamic> json) {
    return TrackValues(
      conversionId: json['conversion_id'],
      conversionLabel: json['conversion_label'],
      pixelId: json['pixel_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "conversion_id": conversionId,
      "conversion_label": conversionLabel,
      "pixel_id": pixelId,
    }..removeWhere((key, value) => value == null);
  }
}
