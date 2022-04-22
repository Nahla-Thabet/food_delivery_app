import 'package:equatable/equatable.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/core/usecase/usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/login_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<Unit, LoginParams>{
  final AuthRepository _authRepository;
  LoginUseCase(this._authRepository);
  @override
  Future<Either<Failure, Unit>> call(LoginParams params) {
    return _authRepository.login(loginEntity: params.loginEntity);
    
  }

}
class LoginParams extends Equatable {
  final LoginEntity loginEntity;

  const LoginParams({
    required this.loginEntity,
  });

  @override
  List<Object?> get props => [
        loginEntity,
      ];
}