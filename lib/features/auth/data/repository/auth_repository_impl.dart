import 'package:dio/dio.dart';
import 'package:mega_trust_food_delivery/features/auth/data/data_source/local_data_source/auth_local_data_source_impl.dart';
import 'package:mega_trust_food_delivery/features/auth/data/data_source/remote_data_source/auth_remote_data_source_impl.dart';
import 'package:mega_trust_food_delivery/features/auth/data/mapper/login_mapper.dart';
import 'package:mega_trust_food_delivery/features/auth/data/mapper/register_mapper.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/register_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/login_entity.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSourceImpl _authRemoteDataSourceImpl;
  final AuthLocalDataSourceImpl _authLocalDataSourceImpl;

  AuthRepositoryImpl(this._authRemoteDataSourceImpl, this._authLocalDataSourceImpl);
  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async{
    try{
       _authRemoteDataSourceImpl.forgetPassword(email: email);
       return right(unit);
    }catch(e){
      return left(CacheFailure('error in forgeting password'));
    }
  }

  @override
  Future<Either<Failure, bool>> isLogged() async {
    try {
      final token = _authLocalDataSourceImpl.getToken();
      if (token == null) {
        return right(false);
      } else {
        return right(true);
      }
    } catch (error) {
      return left(CacheFailure('Error while checking on login status'));
    }
  }
  

  @override
  Future<Either<Failure, Unit>> login({required LoginEntity loginEntity})async {
    try{
      final response= await _authRemoteDataSourceImpl.login(loginrModel: loginEntity.toModel);
      await _authLocalDataSourceImpl.saveToken(response.data.token);
      return right(unit);
    }catch(error){
      return left(CacheFailure('error in login'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
   try{
     final token= _authLocalDataSourceImpl.getToken()!;
     await _authLocalDataSourceImpl.deleteToken();
     final response= await _authRemoteDataSourceImpl.logout(
       token: 'Bearer $token' );
       return right(unit);

   }catch(error){
     return left(CacheFailure('Error while logout'));
   }
  }

  @override
  Future<Either<Failure, Unit>> register({required RegisterEntity registerEntity})async 
  {
    try{
      final response= await _authRemoteDataSourceImpl.register(
        registerModel:registerEntity.toModel);
        await _authLocalDataSourceImpl.saveToken(response.data.token);
        return right(unit);

    }catch(error){
      return left(CacheFailure('Error while register'));

    }
  
  }

}