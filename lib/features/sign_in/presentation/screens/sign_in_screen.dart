import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
// ignore: unused_import
import '../../../user_role_selection/presentation/widgets/role_selection_section.dart';
import '../bloc/register_bloc.dart';
import '../widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: getIt<SignInCubit>(),
        child: RegisterBody(),
      ),
    );
  }
}
