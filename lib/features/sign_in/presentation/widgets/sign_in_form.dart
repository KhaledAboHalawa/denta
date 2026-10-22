import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/features/sign_in/domain/entities/sign_in_request_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../bloc/sign_in_bloc.dart';
import 'forget_password_section.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isInit = true;

  late final SignInCubit _cubit;
  late final GlobalKey<FormState> _formKey;
  late final AppLocalizations locale;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<SignInCubit>();
    emailController = TextEditingController(text: _cubit.state.params.email);
    passwordController = TextEditingController(
      text: _cubit.state.params.password,
    );
    nodes = [FocusNode(), FocusNode()];
    _formKey = GlobalKey<FormState>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      locale = AppLocalizations.of(context)!;
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
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
            controller: emailController,
            hint: locale.signInEmailHint,
            focusNode: nodes[0],
            keyboardType: .emailAddress,
            validator: (value) => AppValidators.validateEmail(value, context: context),
            onSubmitted: (_) {
              if (emailController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            onChange: (value) {
              _cubit.doIntent(
                SignInUpdateTextFieldsValuesEvent(
                  params: SignInRequestParams(
                    email: value,
                    password: passwordController.text,
                  ),
                ),
              );
            },
            labelText: locale.signInEmailLabel,
          ),

          const SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            hint: locale.signInPasswordHint,
            focusNode: nodes[1],
            isPassword: true,
            keyboardType: .visiblePassword,
            validator: (value) => AppValidators.validateRequired(
              value,
              context: context,
              fieldName: locale.signInPasswordLabel,
            ),
            onSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
                _cubit.doIntent(
                  SignInSubmitEvent(
                    params: SignInRequestParams(
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                  ),
                );
              }
            },
            onChange: (value) {
              _cubit.doIntent(
                SignInUpdateTextFieldsValuesEvent(
                  params: SignInRequestParams(
                    email: emailController.text,
                    password: value,
                  ),
                ),
              );
            },
            labelText: locale.signInPasswordLabel,
          ),
          const SizedBox(height: 12),
          const ForgetPasswordSection(),
          const SizedBox(height: 32),
          BlocSelector(
            bloc: _cubit,
            selector: (SignInState state) => state.response.isLoading,
            builder: (context, isLoading) => CustomButton(
              title: locale.logIn,
              isLoading: isLoading,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _cubit.doIntent(
                    SignInSubmitEvent(
                      params: SignInRequestParams(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
