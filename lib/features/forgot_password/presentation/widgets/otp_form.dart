import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/otp_request_params.dart';
import '../bloc/forgot_password_bloc.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    final code = context.read<ForgotPasswordCubit>().state.otpParams.code;
    _controllers = List.generate(
      4,
      (index) => TextEditingController(
        text: index < code.length ? code[index] : '',
      ),
    );
    _focusNodes = List.generate(4, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _clearFields() {
    for (final controller in _controllers) {
      controller.clear();
    }
    context.read<ForgotPasswordCubit>().doIntent(
      ForgotPasswordUpdateOtpEvent(
        params: context.read<ForgotPasswordCubit>().state.otpParams.copyWith(
          code: '',
        ),
      ),
    );
    _focusNodes.first.requestFocus();
  }

  void _verifyCode() {
    final locale = AppLocalizations.of(context)!;
    final code = _controllers.map((controller) => controller.text).join();

    if (code.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(locale.otpInvalidCode)),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    final cubit = context.read<ForgotPasswordCubit>();
    cubit.doIntent(ForgotPasswordVerifyOtpEvent(
      params: cubit.state.otpParams.copyWith(code: code),
    ));
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remaining = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$remaining';
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final cubit = context.read<ForgotPasswordCubit>();

    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.resendResponse.status != current.resendResponse.status,
      listener: (context, state) {
        if (state.resendResponse.isSuccess) _clearFields();
      },
      child: Column(
        children: [
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: index == 3 ? 0 : 8),
                  child: SizedBox(
                    height: 52,
                    child: TextField(
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: context.text.heading3.copyWith(
                        color: context.appColors.primary,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(1),
                      ],
                      decoration: InputDecoration(
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: context.appColors.inputFill,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: context.appColors.secondary,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: context.appColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        final code = _controllers
                            .map((controller) => controller.text)
                            .join();
                        cubit.doIntent(ForgotPasswordUpdateOtpEvent(
                          params: cubit.state.otpParams.copyWith(code: code),
                        ));

                        if (value.isNotEmpty && index < 3) {
                          _focusNodes[index + 1].requestFocus();
                        } else if (value.isEmpty && index > 0) {
                          _focusNodes[index - 1].requestFocus();
                        }
                        if (index == 3 && value.isNotEmpty) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 32),
          BlocSelector<ForgotPasswordCubit, ForgotPasswordState, bool>(
            selector: (state) => state.response.isLoading,
            builder: (context, isLoading) => CustomButton(
              title: locale.verifyCode,
              isLoading: isLoading,
              onPressed: isLoading ? null : _verifyCode,
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.remainingSeconds != current.remainingSeconds,
            builder: (context, state) => Text(
              _formatTime(state.remainingSeconds),
              style: context.text.captionDefault.copyWith(
                color: context.appColors.textMain,
              ),
            ),
          ),
          const SizedBox(height: 6),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.remainingSeconds != current.remainingSeconds ||
                previous.resendResponse.status != current.resendResponse.status,
            builder: (context, state) {
              final canResend = state.remainingSeconds == 0 &&
                  !state.resendResponse.isLoading;
              return Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    '${locale.didntGetIt} ',
                    style: context.text.labelDefault.copyWith(
                      color: context.appColors.textMain,
                    ),
                  ),
                  TextButton(
                    onPressed: canResend
                        ? () => cubit.doIntent(
                              const ForgotPasswordResendOtpEvent(),
                            )
                        : null,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      locale.resendCode,
                      style: context.text.labelDefault.copyWith(
                        color: canResend
                            ? context.appColors.primary
                            : context.appColors.info,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
