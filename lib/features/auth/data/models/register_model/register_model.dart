import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel{
  String email;
  String name;
  String password;
 @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;

RegisterModel({required this.email, required this.name, required this.password, required this.passwordConfirmation});
  
  Map<String, dynamic>toJson() => _$RegisterModelToJson(this);
}