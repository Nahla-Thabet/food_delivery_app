
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel{
  String email;
 String password;

  LoginModel({
    required this.email, required this.password
  });

  Map<String, dynamic>toJson() => _$LoginModelToJson(this);
}