import 'package:denta/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'forget_password_section.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _isInit = true;

  late final AppLocalizations locale;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    nodes = [FocusNode(), FocusNode()];
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
            validator: (value) => AppValidators.validateEmail(value),
            onSubmitted: (_) {
              if (emailController.text.isNotEmpty) {
                nodes[1].requestFocus();
              }
            },
            onChange: (value) {},
            labelText: locale.signInEmailLabel,
          ),

          const SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            hint: locale.signInPasswordHint,
            focusNode: nodes[1],
            isPassword: true,
            keyboardType: .visiblePassword,
            validator: (value) => AppValidators.validatePassword(value),
            onSubmitted: (_) {
              if (emailController.text.isNotEmpty &
                  _formKey.currentState!.validate()) {}
            },
            onChange: (value) {},
            labelText: locale.signInPasswordLabel,
          ),
          const SizedBox(height: 24),
          const ForgetPasswordSection(),
          const SizedBox(height: 32),
          CustomButton(
            title: locale.logIn,
            isLoading: false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {}
            },
          ),
        ],
      ),
    );
  }
}
