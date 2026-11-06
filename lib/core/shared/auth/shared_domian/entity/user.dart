import '../../../../../features/questionnaire/domain/entities/verification_info_params.dart';
import '../../../../../features/user_role_selection/presentation/widgets/role_selection_section.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final Gender gender;
  final UserRole role;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.role,
  });
}
