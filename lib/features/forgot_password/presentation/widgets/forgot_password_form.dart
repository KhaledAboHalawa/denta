import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/features/forgot_password/domain/entities/forgot_password_request_params.dart';
import 'package:denta/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool _isInit = true;

  late final ForgotPasswordCubit _cubit;
  late final GlobalKey<FormState> _formKey;
  late final AppLocalizations locale;
  late final TextEditingController emailController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ForgotPasswordCubit>();
    emailController = TextEditingController(text: _cubit.state.params.email);
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
            labelText: locale.signInEmailLabel,
          ),
          const SizedBox(height: 32),
          BlocSelector(
            bloc: _cubit,
            selector: (ForgotPasswordState state) => state.response.isLoading,
            builder: (context, isLoading) => CustomButton(
              title: locale.logIn,
              isLoading: isLoading,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _cubit.doIntent(
                    ForgotPasswordSubmitEvent(
                      params: ForgotPasswordRequestParams(
                        email: emailController.text,
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
