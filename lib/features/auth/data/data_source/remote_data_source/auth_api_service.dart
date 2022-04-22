import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_food_delivery/core/constant.dart';
import 'package:mega_trust_food_delivery/core/data/response_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/login_model/login_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/register_model/register_model.dart';
import 'package:mega_trust_food_delivery/features/auth/data/models/token_model/token_model.dart';
import 'package:retrofit/http.dart';
part 'auth_api_service.g.dart';

@RestApi (baseUrl: baseUrl )

@injectable
abstract class ApiService{
  @factoryMethod
  factory ApiService (Dio dio){

    return _ApiService(dio,);
  }
  @POST ('/register')
   Future<ResponseModel<TokenModel>> register ({
     @Body() required RegisterModel registerModel,
   });
  @POST ('/login')
  Future<ResponseModel<TokenModel>> login ({
    @Body() required LoginModel loginModel,
    });

    @POST ('/logout')
    Future<ResponseModel> logout({
      @Header('Authorization') required String token,
    });


    @POST ('/forgetPassword')
    Future<ResponseModel> forgetPassword({
      @Body() required  String email,
    });

}