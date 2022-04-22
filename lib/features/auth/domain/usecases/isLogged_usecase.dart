import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:mega_trust_food_delivery/core/usecase/usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/repository/auth_repository.dart';

class IsLoggedUseCase extends UseCase<bool, NoParams>{
  final AuthRepository _authRepository;

  IsLoggedUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
   return _authRepository.isLogged();
  }
  
}