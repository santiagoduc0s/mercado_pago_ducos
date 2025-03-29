import 'package:mercado_pago_flowlabs/src/core/client/client.dart'
    show RequestBody;

class GetPreferenceRequestBody implements RequestBody {
  GetPreferenceRequestBody({
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
