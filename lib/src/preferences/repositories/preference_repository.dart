import 'package:mercado_pago_ducos/src/preferences/datasources/datasources.dart';
import 'package:mercado_pago_ducos/src/preferences/entities/entities.dart';

class PreferenceRepository {
  PreferenceRepository({
    required this.datasource,
  });

  final PreferenceDatasource datasource;

  Future<CreatePreferenceResponseBody> createPreference(
    CreatePreferenceRequestBody request,
  ) {
    return datasource.createPreference(request);
  }

  Future<SearchPreferencesResponseBody> searchPreferences(
    SearchPreferencesRequestBody request,
  ) {
    return datasource.searchPreferences(request);
  }

  Future<GetPreferenceResponseBody> getPreference(
    GetPreferenceRequestBody request,
  ) {
    return datasource.getPreference(request);
  }

  Future<UpdatePreferenceResponseBody> updatePreference(
    UpdatePreferenceRequestBody request,
  ) {
    return datasource.updatePreference(request);
  }
}
