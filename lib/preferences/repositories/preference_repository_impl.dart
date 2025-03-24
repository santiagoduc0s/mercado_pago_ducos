import 'package:mercado_pago_flowlabs/preferences/datasources/datasources.dart';
import 'package:mercado_pago_flowlabs/preferences/entities/entities.dart';
import 'package:mercado_pago_flowlabs/preferences/repositories/repositories.dart';

class PreferenceRepositoryImpl implements PreferenceRepository {
  PreferenceRepositoryImpl(this.datasource);

  final PreferenceDatasource datasource;

  @override
  Future<CreatePreferenceResponse> createPreference(
    CreatePreferenceResponse request,
  ) {
    return datasource.createPreference(request);
  }
}
