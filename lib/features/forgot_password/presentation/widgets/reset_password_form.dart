import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/features/forgot_password/domain/entities/reset_password_request_params.dart';
import 'package:denta/features/forgot_password/presentation/bloc/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final List<FocusNode> _nodes;

  @override
  void initState() {
    super.initState();
    final params = context.read<ResetPasswordCubit>().state.params;
    _formKey = GlobalKey<FormState>();
    _passwordController = TextEditingController(text: params.password);
    _confirmPasswordController =
        TextEditingController(text: params.confirmPassword);
    _nodes = [FocusNode(), FocusNode()];
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    for (final node in _nodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _submit(ResetPasswordCubit cubit) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    cubit.doIntent(
      ResetPasswordSubmitEvent(
        params: ResetPasswordRequestParams(
          password: _passwordController.text,
          confirmPassword: _confirmPasswordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final cubit = context.read<ResetPasswordCubit>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: _passwordController,
            hint: locale.createPasswordHint,
            focusNode: _nodes[0],
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return locale.passwordRequired;
              }
              if (value.length < 8) {
                return locale.passwordMinLength;
              }
              return null;
            },
            onChange: (value) {
              cubit.doIntent(
                ResetPasswordUpdateTextFieldsValuesEvent(
                  params: ResetPasswordRequestParams(
                    password: value,
                    confirmPassword: _confirmPasswordController.text,
                  ),
                ),
              );
            },
            onSubmitted: (_) => _nodes[1].requestFocus(),
            labelText: locale.newPassword,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: _confirmPasswordController,
            hint: locale.confirmPasswordHint,
            focusNode: _nodes[1],
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return locale.confirmPasswordRequired;
              }
              if (value != _passwordController.text) {
                return locale.passwordsDoNotMatch;
              }
              return null;
            },
            onChange: (value) {
              cubit.doIntent(
                ResetPasswordUpdateTextFieldsValuesEvent(
                  params: ResetPasswordRequestParams(
                    password: _passwordController.text,
                    confirmPassword: value,
                  ),
                ),
              );
            },
            onSubmitted: (_) => _submit(cubit),
            labelText: locale.confirmPassword,
          ),
          const SizedBox(height: 32),
          BlocSelector<ResetPasswordCubit, ResetPasswordState, bool>(
            selector: (state) => state.response.isLoading,
            builder: (context, isLoading) {
              return CustomButton(
                title: locale.resetPasswordButton,
                isLoading: isLoading,
                onPressed: isLoading ? null : () => _submit(cubit),
              );
            },
          ),
        ],
      ),
    );
  }
}
