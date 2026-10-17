import 'package:denta/core/di/dependency_injection.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/features/auth/register/domain/entities/register_request_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../bloc/register_bloc.dart';

class FirstRegisterForm extends StatefulWidget {
  const FirstRegisterForm({super.key});

  @override
  State<FirstRegisterForm> createState() => _FirstRegisterFormState();
}

class _FirstRegisterFormState extends State<FirstRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(
      text: getIt<RegisterBloc>().state.params.firstName,
    );
    lastNameController = TextEditingController(
      text: getIt<RegisterBloc>().state.params.lastName,
    );
    emailController = TextEditingController(
      text: getIt<RegisterBloc>().state.params.email,
    );

    nodes = [FocusNode(), FocusNode(), FocusNode()];
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
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
            controller: firstNameController,
            hint: AppLocalizations.of(context)!.registerFirstNameHint,
            focusNode: nodes[0],
            keyboardType: .name,
            validator: (value) => AppValidators.validateName(value),
            onSubmitted: (_) {
              if (firstNameController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            labelText: AppLocalizations.of(context)!.registerFirstNameLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: lastNameController,
            hint: AppLocalizations.of(context)!.registerLastNameHint,
            focusNode: nodes[1],
            keyboardType: .name,
            validator: (value) => AppValidators.validateName(value),
            onSubmitted: (_) {
              if (lastNameController.text.isNotEmpty) {
                nodes[2].requestFocus();
              }
            },
            labelText: AppLocalizations.of(context)!.registerLastNameLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: emailController,
            hint: AppLocalizations.of(context)!.registerEmailHint,
            focusNode: nodes[2],
            keyboardType: .emailAddress,
            validator: (value) => AppValidators.validateEmail(value),
            onSubmitted: (_) {
              if (emailController.text.isNotEmpty) {
                context.read<RegisterBloc>().doIntent(
                  RegisterContinueEvent(
                    params: RegisterRequestParams(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
                    ),
                  ),
                );
              }
            },
            labelText: AppLocalizations.of(context)!.registerEmailLabel,
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: AppLocalizations.of(context)!.registerContinue,
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<RegisterBloc>().doIntent(
                  RegisterContinueEvent(
                    params: RegisterRequestParams(
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      email: emailController.text,
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
