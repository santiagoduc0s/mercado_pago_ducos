import 'package:mercado_pago_ducos/src/core/client/client.dart'
    show RequestBody;

class GetSubscriptionRequestBody implements RequestBody {
  GetSubscriptionRequestBody({
    required this.id,
  });
  
  /// Preference ID.
  final String id;
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
    }..removeWhere((key, value) => value == null);
  }
}
