import 'package:mercado_pago_ducos/src/core/client/client.dart';
import 'package:mercado_pago_ducos/src/preferences/datasources/datasources.dart';
import 'package:mercado_pago_ducos/src/preferences/entities/entities.dart';

class PreferenceApiDatasource extends PreferenceDatasource {
  PreferenceApiDatasource({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<CreatePreferenceResponseBody> createPreference(
    CreatePreferenceRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/preferences/create-preference',
      method: HttpMethod.post,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return CreatePreferenceResponseBody.fromJson(response.data);
  }

  @override
  Future<SearchPreferencesResponseBody> searchPreferences(
    SearchPreferencesRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/preferences/search-preferences',
      method: HttpMethod.get,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return SearchPreferencesResponseBody.fromJson(response.data);
  }

  @override
  Future<GetPreferenceResponseBody> getPreference(
    GetPreferenceRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/preferences/get-preference',
      method: HttpMethod.get,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return GetPreferenceResponseBody.fromJson(response.data);
  }

  @override
  Future<UpdatePreferenceResponseBody> updatePreference(
    UpdatePreferenceRequestBody body,
  ) async {
    final req = RequestHttp(
      path: '/preferences/update-preference',
      method: HttpMethod.put,
      data: body,
    );

    final response = await client.fetch(req);

    if (response.isNotOk) {
      throw Exception(response.data);
    }

    return UpdatePreferenceResponseBody.fromJson(response.data);
  }
}
