import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../domain/entities/register_request_params.dart';
import '../bloc/register_bloc.dart';

class SecondRegisterForm extends StatefulWidget {
  const SecondRegisterForm({super.key});

  @override
  State<SecondRegisterForm> createState() => _SecondRegisterFormState();
}

class _SecondRegisterFormState extends State<SecondRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController(
      text: getIt<RegisterBloc>().state.params.password,
    );
    confirmPasswordController = TextEditingController(
      text: getIt<RegisterBloc>().state.params.confirmPassword,
    );

    nodes = [FocusNode(), FocusNode()];
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    for (var node in nodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: passwordController,
            hint: AppLocalizations.of(context)!.registerPasswordHint,
            focusNode: nodes[0],
            isPassword: true,
            validator: (value) => AppValidators.validatePassword(value),
            onSubmitted: (_) {
              if (passwordController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            labelText: AppLocalizations.of(context)!.registerPasswordLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: confirmPasswordController,
            hint: AppLocalizations.of(context)!.registerConfirmPasswordHint,
            focusNode: nodes[1],
            isPassword: true,
            validator: (value) => AppValidators.validatePassword(value),
            onSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
                context.read<RegisterBloc>().doIntent(
                  RegisterSubmitEvent(
                    params: RegisterRequestParams(
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    ),
                  ),
                );
              }
            },
            labelText: AppLocalizations.of(context)!.registerConfirmPasswordLabel,
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: AppLocalizations.of(context)!.registerContinue,
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<RegisterBloc>().doIntent(
                  RegisterSubmitEvent(
                    params: RegisterRequestParams(
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
