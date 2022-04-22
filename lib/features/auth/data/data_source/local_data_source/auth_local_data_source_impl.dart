import 'package:injectable/injectable.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/data_source/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;

  const AuthLocalDataSourceImpl(this._sharedPreferences);

  @override
  Future<bool> saveToken(String token) =>
      _sharedPreferences.setString('token', token);



  @override
  Future<void> deleteToken() => _sharedPreferences.remove('token');

  @override
  String? getToken() {
    return  _sharedPreferences.getString('token');
  }
}
