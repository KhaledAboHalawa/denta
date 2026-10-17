class  RegisterRequestModel {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };  
}