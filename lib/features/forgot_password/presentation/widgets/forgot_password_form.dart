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
  late final ForgotPasswordCubit _cubit;
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController emailController;
  late final FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _cubit = getIt<ForgotPasswordCubit>();
    _formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: _cubit.state.params.email);
    _emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: emailController,
            hint: locale.signInEmailHint,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.validateEmail,
            labelText: locale.signInEmailLabel,
            onSubmitted: (_) {
              if (_formKey.currentState!.validate()) {
                FocusScope.of(context).unfocus();
              }
            },
          ),
          const SizedBox(height: 32),
          BlocSelector<ForgotPasswordCubit, ForgotPasswordState, bool>(
            bloc: _cubit,
            selector: (state) => state.response.isLoading,
            builder: (context, isLoading) {
              return CustomButton(
                title: locale.sendCode,
                isLoading: isLoading,
                onPressed: isLoading
                    ? null
                    : () {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState!.validate()) {
                          _cubit.doIntent(
                            ForgotPasswordSubmitEvent(
                              params: ForgotPasswordRequestParams(
                                email: emailController.text.trim(),
                              ),
                            ),
                          );
                        }
                      },
              );
            },
          ),
        ],
      ),
    );
  }
}
