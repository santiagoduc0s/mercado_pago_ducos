import 'package:mercado_pago_flowlabs/preferences/entities/entities.dart';

abstract class PreferenceRepository {
  Future<CreatePreferenceResponse> createPreference(
    CreatePreferenceResponse request,
  );
}
