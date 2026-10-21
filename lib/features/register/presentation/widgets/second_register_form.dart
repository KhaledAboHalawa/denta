import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:denta/core/widgets/custom_text_field.dart';
import 'package:denta/features/register/domain/entities/register_request_params.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../bloc/register_bloc.dart';

class SecondRegisterForm extends StatefulWidget {
  const SecondRegisterForm({super.key});

  @override
  State<SecondRegisterForm> createState() => _SecondRegisterFormState();
}

class _SecondRegisterFormState extends State<SecondRegisterForm> {
  bool _isInit = true;

  late final AppLocalizations locale;
  late final RegisterBloc bloc;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    bloc = getIt<RegisterBloc>();
    _formKey = GlobalKey<FormState>();
    passwordController = TextEditingController(
      text: bloc.state.params.password,
    );
    confirmPasswordController = TextEditingController(
      text: bloc.state.params.confirmPassword,
    );

    nodes = [FocusNode(), FocusNode()];
    nodes[0].requestFocus();
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
            hint: locale.registerPasswordHint,
            focusNode: nodes[0],
            keyboardType: .visiblePassword,
            isPassword: true,
            validator: (value) => AppValidators.validatePassword(value, context: context),
            onSubmitted: (_) {
              if (passwordController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            onChange: (value){
              bloc.doIntent(RegisterUpdateTextFieldsValuesEvent(params: RegisterRequestParams(password: value)));
            },
            labelText: locale.registerPasswordLabel,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: confirmPasswordController,
            hint: locale.registerConfirmPasswordHint,
            focusNode: nodes[1],
            keyboardType: .visiblePassword,
            isPassword: true,
            validator: (value) => AppValidators.validateConfirmPassword(
              value,
              passwordController.text,
              context: context,
              fieldName: locale.registerConfirmPasswordLabel,
            ),
            onSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
                bloc.doIntent(
                  RegisterSubmitEvent(
                    params: RegisterRequestParams(
                      password: passwordController.text,
                      confirmPassword: confirmPasswordController.text,
                    ),
                  ),
                );
              }
            },
            onChange: (value){
              bloc.doIntent(RegisterUpdateTextFieldsValuesEvent(params: RegisterRequestParams(confirmPassword: value)));
            },
            labelText: locale.registerConfirmPasswordLabel,
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: locale.continueButton,
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                bloc.doIntent(
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
