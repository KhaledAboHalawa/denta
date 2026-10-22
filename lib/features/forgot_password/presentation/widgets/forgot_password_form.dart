import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:denta/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/forgot_password_request_params.dart';
import '../bloc/forgot_password_bloc.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final FocusNode _emailFocusNode;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController(
      text: context.read<ForgotPasswordCubit>().state.emailParams.email,
    );
    _emailFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _submit(ForgotPasswordCubit cubit) {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;

    cubit.doIntent(ForgotPasswordSubmitEmailEvent(
      params: ForgotPasswordRequestParams(email: _emailController.text.trim()),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final cubit = context.read<ForgotPasswordCubit>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: _emailController,
            hint: locale.signInEmailHint,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.validateEmail,
            labelText: locale.signInEmailLabel,
            onChange: (value) => cubit.doIntent(
              ForgotPasswordUpdateEmailEvent(
                params: ForgotPasswordRequestParams(email: value),
              ),
            ),
            onSubmitted: (_) => _submit(cubit),
          ),
          const SizedBox(height: 32),
          BlocSelector<ForgotPasswordCubit, ForgotPasswordState, bool>(
            selector: (state) => state.response.isLoading,
            builder: (context, isLoading) => CustomButton(
              title: locale.sendCode,
              isLoading: isLoading,
              onPressed: isLoading ? null : () => _submit(cubit),
            ),
          ),
        ],
      ),
    );
  }
}
