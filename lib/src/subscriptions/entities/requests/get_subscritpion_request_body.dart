import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;

/// Request payload for retrieving a subscription.
///
/// This class implements the [RequestBody] interface and encapsulates the
/// subscription ID needed to fetch a specific subscription.
class GetSubscriptionRequestBody implements RequestBody {
  /// Creates an instance of [GetSubscriptionRequestBody] with the provided subscription ID.
  GetSubscriptionRequestBody({
    required this.id,
  });

  /// Subscription ID.
  final String id;

  /// Converts the [GetSubscriptionRequestBody] instance into a JSON map.
  ///
  /// The resulting map contains the key 'id' mapped to the subscription ID.
  /// Any key with a `null` value is removed from the map.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    }..removeWhere((key, value) => value == null);
  }
}
