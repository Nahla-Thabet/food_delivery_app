import 'package:mega_trust_food_delivery/features/auth/data/data_source/remote_data_source/auth_api_service.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/token_model/token_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_food_delivery/core/data/response_model.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final ApiService _apiService;

  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<ResponseModel<TokenModel>> login({required LoginModel loginrModel}) async {
   return await _apiService.login(loginModel: loginrModel);
  }

  @override
  Future<ResponseModel> logout({required String token}) async {
    return await _apiService.logout(token: token);
  }

  @override
  Future<ResponseModel<TokenModel>> register({required RegisterModel registerModel}) async {
    return await _apiService.register(registerModel: registerModel);
  }

  @override
  Future<ResponseModel> forgetPassword({required String email}) async {
   return await _apiService.forgetPassword(email: email);
  }

}