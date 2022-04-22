import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mega_trust_food_delivery/core/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppModule{
@module
  Dio get getDio => Dio(
        BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
        ),
      );

      
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}