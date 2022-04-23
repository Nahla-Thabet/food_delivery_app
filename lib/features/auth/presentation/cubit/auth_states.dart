import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_states.freezed.dart';

@Freezed()
class AuthState with _$AuthState {

  factory AuthState.initial()= _Initial;
  factory AuthState.loading()= _Loading;
  factory AuthState.success()= _Success;
  factory AuthState.error({required String errorMessage})= _Error;
   const factory AuthState.loggedIn() = AuthLoggedIn;
  const factory AuthState.notLoggedIn() = AuthNotLoggedIn;

}
