import 'package:denta/core/config/base_state/base_state.dart';
import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../bloc/forgot_password_bloc.dart';

class OtpForm extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;

  const OtpForm({super.key, this.length = 4, required this.onCompleted});

  @override
  State<OtpForm> createState() => _OtpCodeWidgetState();
}

class _OtpCodeWidgetState extends State<OtpForm> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  late final ForgotPasswordCubit _cubit;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    _cubit = getIt<ForgotPasswordCubit>();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');

    return '$minutes:$remainingSeconds';
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listenWhen: (previous, current) =>
          previous.resendResponse.status != current.resendResponse.status,
      listener: (context, state) {
        if (state.resendResponse.isSuccess) {
          _controller.clear();
        }
      },
      child: Column(
        children: [
          ManualOtpField(
            controller: _controller,
            length: widget.length,
            onCompleted: widget.onCompleted,
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
                            _cubit.doIntent(
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
}

class ManualOtpField extends StatefulWidget {
  const ManualOtpField({
    super.key,
    required this.controller,
    required this.length,
    this.onCompleted,
  });

  final TextEditingController controller; // بيحمل الكود كامل
  final int length;
  final ValueChanged<String>? onCompleted;

  @override
  State<ManualOtpField> createState() => _ManualOtpFieldState();
}

class _ManualOtpFieldState extends State<ManualOtpField> {
  static const _zw = '\u200b';
  static final _nonDigits = RegExp(r'\D');

  late final List<TextEditingController> _boxes;
  late final List<FocusNode> _nodes;
  bool _syncing = false;

  @override
  void initState() {
    super.initState();
    _boxes = List.generate(
      widget.length,
      (_) => TextEditingController.fromValue(_value('')),
    );
    _nodes = List.generate(widget.length, (_) => FocusNode());
    widget.controller.addListener(_onExternalChange);
    _onExternalChange();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onExternalChange);
    for (final b in _boxes) {
      b.dispose();
    }
    for (final n in _nodes) {
      n.dispose();
    }
    super.dispose();
  }

  // كل خانة = الحرف الشفاف + الرقم (لو موجود)، والمؤشر في الآخر
  TextEditingValue _value(String digit) {
    final text = _zw + digit;
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }

  void _setBox(int i, String digit) => _boxes[i].value = _value(digit);

  // تغيير جاي من برّه (مثلاً _controller.clear() بعد إعادة الإرسال)
  void _onExternalChange() {
    if (_syncing) return;
    final digits = widget.controller.text.replaceAll(_nonDigits, '');
    for (var i = 0; i < widget.length; i++) {
      _setBox(i, i < digits.length ? digits[i] : '');
    }
  }

  void _publish() {
    final code = _boxes.map((b) => b.text.replaceAll(_nonDigits, '')).join();
    _syncing = true;
    widget.controller.text = code;
    _syncing = false;

    if (code.length == widget.length) {
      FocusScope.of(context).unfocus();
      widget.onCompleted?.call(code);
    }
  }

  void _onChanged(int i, String value) {
    // 1) Backspace على خانة فاضية: اتمسح الحرف الشفاف نفسه
    if (value.isEmpty) {
      _setBox(i, '');
      if (i > 0) {
        _setBox(i - 1, '');
        _nodes[i - 1].requestFocus();
      }
      _publish();
      return;
    }

    final digits = value.replaceAll(_nonDigits, '');

    // 2) اتمسح الرقم بس (فضل الحرف الشفاف)
    if (digits.isEmpty) {
      _setBox(i, '');
      _publish();
      return;
    }

    // 3) لصق أو autofill لكود كامل: وزّعه على الخانات
    if (digits.length > 2) {
      for (var k = 0; k < widget.length; k++) {
        _setBox(k, k < digits.length ? digits[k] : '');
      }
      _publish();
      return;
    }

    // 4) رقم اتكتب: خد آخر رقم وانقل للخانة اللي بعدها
    _setBox(i, digits[digits.length - 1]);
    if (i < widget.length - 1) _nodes[i + 1].requestFocus();
    _publish();
  }

  // الخانة اللي عليها الدور
  int get _currentIndex {
    final i = _boxes.indexWhere(
      (b) => b.text.replaceAll(_nonDigits, '').isEmpty,
    );
    return i == -1 ? widget.length - 1 : i;
  }

  void _focusCurrent() {
    _nodes[_currentIndex].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final textStyle = context.text.heading3.copyWith(
      fontWeight: FontWeight.w700,
      color: colors.primary,
      fontFamily: "IBM Plex Sans Arabic",
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: _focusCurrent,
        child: AbsorbPointer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.length, (i) {
              return ListenableBuilder(
                listenable: Listenable.merge([_boxes[i], _nodes[i]]),
                builder: (context, _) {
                  // نفس منطق Pinput: الخانة المكتوبة أو الحالية بلون primary
                  final active =
                      _nodes[i].hasFocus || _boxes[i].text.length > 1;
                  return Container(
                    width: 86,
                    height: 56,
                    padding: const EdgeInsets.all(1.135),
                    alignment: Alignment.center,
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

                    child: TextField(
                      controller: _boxes[i],
                      focusNode: _nodes[i],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: textStyle,
                      showCursor: false,
                      enableInteractiveSelection: false,
                      autofillHints: const [AutofillHints.oneTimeCode],
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
                      onChanged: (v) => _onChanged(i, v),
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
