// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../features/auth/data/data_source/local_data_source/auth_local_data_source_impl.dart'
    as _i6;
import '../features/auth/data/data_source/remote_data_source/auth_api_service.dart'
    as _i3;
import '../features/auth/domain/data_source/auth_local_data_source.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ApiService>(() => _i3.ApiService(get<_i4.Dio>()));
  gh.lazySingleton<_i5.AuthLocalDataSource>(
      () => _i6.AuthLocalDataSourceImpl(get<_i7.SharedPreferences>()));
  return get;
}
