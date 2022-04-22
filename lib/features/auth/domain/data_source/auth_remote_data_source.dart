import 'package:mega_trust_food_delivery/core/data/response_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/token_model/token_model.dart';

abstract class AuthRemoteDataSource{
  Future<ResponseModel<TokenModel>>  register({
    required RegisterModel registerModel
  });

  Future<ResponseModel<TokenModel>>  login({
    required LoginModel loginrModel
  });

  Future<ResponseModel>logout({
    required String token

  });
  Future<ResponseModel>forgetPassword({
    required String email,
  });

}