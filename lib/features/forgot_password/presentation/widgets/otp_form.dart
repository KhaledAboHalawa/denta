import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';

class OtpForm extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;

  const OtpForm({super.key, this.length = 4, required this.onCompleted});

  @override
  State<OtpForm> createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpForm> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.length, (_) => TextEditingController());

    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }

    super.dispose();
  }

  int _currentIndex() {
    for (var index = 0; index < widget.length; index++) {
      if (_controllers[index].text.isEmpty) {
        return index;
      }
    }

    return widget.length - 1;
  }

  void _focusCurrent() {
    _focusNodes[_currentIndex()].requestFocus();
  }

  void _clearFields() {
    for (final controller in _controllers) {
      controller.clear();
    }

    _focusNodes.first.requestFocus();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();

        final otp = _controllers.map((controller) => controller.text).join();

        widget.onCompleted(otp);
      }
    }
  }

  void _onKeyEvent(KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    final cubit = context.read<ForgotPasswordCubit>();

    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.resendResponse.status != current.resendResponse.status,
      listener: (context, state) {
        if (state.resendResponse.isSuccess) {
          _clearFields();
        }
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: _focusCurrent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.length, _buildOtpField),
            ),
          ),
          const SizedBox(height: 24),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.remainingSeconds != current.remainingSeconds,
            builder: (context, state) {
              return Text(
                _formatTime(state.remainingSeconds),
                style: context.text.captionDefault.copyWith(
                  color: context.appColors.textMain,
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            buildWhen: (previous, current) =>
                previous.remainingSeconds != current.remainingSeconds ||
                previous.resendResponse.status != current.resendResponse.status,
            builder: (context, state) {
              final canResend =
                  state.remainingSeconds == 0 &&
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
                        ? () {
                            cubit.doIntent(
                              const ForgotPasswordResendOtpEvent(),
                            );
                          }
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

  Widget _buildOtpField(int index) {
    final controller = _controllers[index];
    final focusNode = _focusNodes[index];

    return SizedBox(
      width: 86,
      height: 56,
      child: Focus(
        canRequestFocus: false,
        onKeyEvent: (_, event) {
          _onKeyEvent(event, index);
          return KeyEventResult.ignored;
        },
        child: ListenableBuilder(
          listenable: Listenable.merge([controller, focusNode]),
          builder: (context, child) {
            final active = controller.text.isNotEmpty || focusNode.hasFocus;

            return Container(
              padding: const EdgeInsets.all(1.135),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(113.462),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    active
                        ? context.appColors.primary
                        : context.appColors.infoHover,
                    context.appColors.infoHover,
                  ],
                ),
              ),
              child: child,
            );
          },
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            autofocus: index == 0,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            showCursor: false,
            enableInteractiveSelection: false,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            style: context.text.heading3.copyWith(
              color: context.appColors.primary,
              fontWeight: FontWeight.w700,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: context.appColors.white,
              counterText: '',
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(113),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(113),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(113),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
            onTapOutside: (_) => focusNode.unfocus(),
          ),
        ),
      ),
    );
  }
}
