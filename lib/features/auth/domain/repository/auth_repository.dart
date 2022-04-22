import 'package:dartz/dartz.dart';
import 'package:mega_trust_food_delivery/core/error/failures.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/login_entity.dart';
import 'package:mega_trust_food_delivery/features/auth/domain/entity/register_entity.dart';

abstract class AuthRepository{
  Future<Either<Failure,Unit>> login({
    required LoginEntity loginEntity
  });
  Future<Either<Failure,Unit>> register({
    required RegisterEntity registerEntity
  });

  Future<Either<Failure,Unit>> forgetPassword({
    required String email
  });
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, bool>> isLogged();
}