class RegisterEntity{
  final String name;
    final String email;
  final String password;

  const RegisterEntity({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
    name,
        email,
        password,
      ];
}