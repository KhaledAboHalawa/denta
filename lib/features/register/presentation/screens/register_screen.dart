import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import '../bloc/register_bloc.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.role});
  final UserRole role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<RegisterBloc>()
          ..doIntent(RegisterSetRoleEvent(role: role))
          ..doIntent(RegisterBackEvent()),
        child: RegisterBody(),
      ),
    );
  }
}
