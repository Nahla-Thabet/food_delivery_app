import 'package:equatable/equatable.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/core/usecase/usecase.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/register_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/repository/auth_repository.dart';

class RegisterUseCase extends UseCase<Unit,Registerparams>{
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);
 
  @override
  Future<Either<Failure, Unit>> call(Registerparams params) {
    return _authRepository.register(registerEntity: params.registerEntity);
  }
  
}

class Registerparams extends Equatable{
final RegisterEntity registerEntity;

  Registerparams(this.registerEntity);

  @override
  List<Object?> get props => [registerEntity];


}