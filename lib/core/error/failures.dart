
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String e;
  Failure(this.e);

  @override
  List<Object> get props => [e];
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String e) : super(e);
}

class CacheFailure extends Failure {
  CacheFailure(String e) : super(e);



}
