import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:mega_trust_food_delivery/core/usecase/usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/repository/auth_repository.dart';

class LogoutUseCase extends UseCase<Unit, NoParams>{
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
   return _authRepository.logout();
  }

}