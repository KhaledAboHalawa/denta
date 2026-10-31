import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';

class RegisterRequestModel {
  final String firstName;
  final String lastName;
  final UserRole role;
  final String email;
  final String password;
  final String confirmPassword;

  const RegisterRequestModel({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "role": role.name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
  };
}
