import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_trust_food_delivery/core/usecase/usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/login_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/register_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/usecases/isLogged_usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/usecases/login_usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/usecases/logout_usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/usecases/register_usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginUseCase, this._registerUseCase, this._logoutUseCase,
      this._isLoggedUseCase)
      : super(AuthState.initial());

  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;
  final IsLoggedUseCase _isLoggedUseCase;

  Future<void> login({
    required String password,
    required String email,
  }) async {
    emit(AuthState.loading());

    final result = await _loginUseCase(LoginParams(
        loginEntity: LoginEntity(email: email, password: password)));
    emit(result.fold((failure) {
      return AuthState.error(errorMessage: failure.e);
    }, (user) {
      print('user: $user');
      return AuthState.success();
    }));
  }

  Future<void> register({
   required RegisterEntity registerEntity
})async {
    emit(AuthState.loading());
    final result= await _registerUseCase(
      Registerparams(registerEntity)
    );
    emit(result.fold((failure) {
      return AuthState.error(errorMessage: failure.e);

    }, (user) {
      print( 'user: $user');
      return AuthState.success();
    }));

  }

  Future <void> logout(NoParams)async{
    emit(AuthState.loading());
    final result= await _logoutUseCase.call(NoParams());
    emit(
      result.fold((failure) => AuthState.error(errorMessage:failure.e), 
      (sucess) => AuthState.success())
    );

  }

  Future <Void> isLoggedIn() async{
    emit(AuthState.loading());
    final result= await _isLoggedUseCase(NoParams());
    emit(
      result.fold(
       (failure) => AuthState.error(errorMessage: 'error'), 
      (success) {
        if(success){
          return AuthLoggedIn();
        }
        else{
          return AuthNotLoggedIn();
        }
      
      }
    
    ));
  }


  // Future<void> isLoggedIn() async {
  //   emit(AuthState.loading());
  //   final result = await _isLoggedUseCase( NoParams());
  //   emit(
  //     result.fold(
  //       (failure) => AuthState.error( errorMessage: 'error'),
  //       (isLoggedIn) {
  //         if (isLoggedIn) {
  //           return const AuthLoggedIn();
  //         } else {
  //           return const AuthNotLoggedIn();
  //         }
  //       },
  //     ),
  //   );
  // }



}
