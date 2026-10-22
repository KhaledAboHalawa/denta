import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/otp_bloc.dart';

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

    _controllers = List.generate(
      4,
      (_) => TextEditingController(),
    );

    _focusNodes = List.generate(
      4,
      (_) => FocusNode(),
    );
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

  void _verifyCode() {
    final locale = AppLocalizations.of(context)!;
    final code = _controllers.map((controller) => controller.text).join();

    if (code.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(locale.otpInvalidCode),
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();

    final cubit = context.read<OtpCubit>();

    cubit.doIntent(
      OtpVerifyEvent(
        params: cubit.state.params.copyWith(code: code),
      ),
    );
  }

  void _clearFields() {
    for (final controller in _controllers) {
      controller.clear();
    }

    _focusNodes.first.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listenWhen: (previous, current) =>
          previous.resendResponse.status !=
          current.resendResponse.status,
      listener: (context, state) {
        if (state.resendResponse.isSuccess) {
          _clearFields();
        }
      },
      child: Column(
        children: [
          Row(
            children: List.generate(4, (index) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == 3 ? 0 : 8,
                  ),
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
          BlocSelector<OtpCubit, OtpState, bool>(
            selector: (state) => state.response.isLoading,
            builder: (context, isLoading) {
              return CustomButton(
                title: AppLocalizations.of(context)!.verifyCode,
                isLoading: isLoading,
                onPressed: isLoading ? null : _verifyCode,
              );
            },
          ),
        ],
      ),
    );
  }
}
