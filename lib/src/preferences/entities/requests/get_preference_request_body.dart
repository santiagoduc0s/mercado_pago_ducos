import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;

/// Request payload for retrieving a payment preference.
///
/// This class implements the [RequestBody] interface and is used to
/// encapsulate the preference ID needed to fetch a specific preference.
class GetPreferenceRequestBody implements RequestBody {
  /// Creates an instance of [GetPreferenceRequestBody] with the provided [id].
  GetPreferenceRequestBody({
    required this.id,
  });

  /// Preference ID.
  final String id;

  /// Converts the [GetPreferenceRequestBody] instance into a JSON map.
  ///
  /// The resulting map includes the key 'id' mapped to the preference ID.
  /// Any key with a `null` value is removed from the map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    }..removeWhere((key, value) => value == null);
  }
}
