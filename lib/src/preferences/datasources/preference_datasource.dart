import 'package:mercado_pago_ducos/src/preferences/entities/entities.dart';

abstract class PreferenceDatasource {
  Future<CreatePreferenceResponseBody> createPreference(
    CreatePreferenceRequestBody body,
  );

  Future<SearchPreferencesResponseBody> searchPreferences(
    SearchPreferencesRequestBody body,
  );

  Future<GetPreferenceResponseBody> getPreference(
    GetPreferenceRequestBody body,
  );

  Future<UpdatePreferenceResponseBody> updatePreference(
    UpdatePreferenceRequestBody body,
  );
}
