import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.onChange,
    this.controller,
    this.isPassword = false,
    this.validator,
    this.canRequestFocus,
    this.focusNode,
    this.onSubmitted,
    this.labelText,
    this.keyboardType,
    this.height = 60,
    this.maxLines = 1,
    this.maxLength,
    this.contentPadding,
    this.reserveHelperSpace = true,
    this.helperText,
    this.prefixIcon,
  });
  final String hint;
  final String? labelText;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final void Function(String value)? onSubmitted;
  final bool? canRequestFocus;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChange;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? prefixIcon;

  /// Total height of the field box (defaults to the original auth value).
  final double height;

  /// `1` keeps the original single-line field; any value above 1 turns the
  /// field into a multiline one that fills [height].
  final int maxLines;

  /// Hard character limit (no built-in counter is shown).
  final int? maxLength;

  /// Defaults to horizontal 8 to keep the existing auth look.
  final EdgeInsetsGeometry? contentPadding;

  /// When false the blank helper line is not reserved under the field.
  final bool reserveHelperSpace;

  /// Visible hint under the field; replaced by the validation error if any.
  final String? helperText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isFocused = false;

  bool get _isMultiline => widget.maxLines > 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        if (widget.labelText != null)
          Text(widget.labelText!, style: context.text.bodyMedium),
        const SizedBox(height: 6),
        SizedBox(
          height: widget.height,
          child: Focus(
            onFocusChange: (focus) {
              setState(() {
                _isFocused = focus;
              });
            },
            child: TextFormField(
              enableInteractiveSelection: !widget.isPassword,
              canRequestFocus: widget.canRequestFocus ?? true,
              validator: widget.validator,
              keyboardType: _isMultiline
                  ? (widget.keyboardType ?? TextInputType.multiline)
                  : widget.keyboardType,
              maxLines: _isMultiline ? null : 1,
              expands: _isMultiline,
              textAlignVertical: _isMultiline ? TextAlignVertical.top : null,
              inputFormatters: widget.maxLength == null
                  ? null
                  : [LengthLimitingTextInputFormatter(widget.maxLength)],
              focusNode: widget.focusNode,
              onFieldSubmitted: widget.onSubmitted,
              onChanged: widget.onChange,
              controller: widget.controller,
              obscureText: widget.isPassword && _obscureText,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon != null
                    ? Icon(
                        widget.prefixIcon,
                        color: _isFocused
                            ? context.appColors.primary
                            : context.appColors.info,
                      )
                    : null,
                floatingLabelBehavior: .never,
                helperText:
                    widget.helperText ??
                    (widget.reserveHelperSpace ? " " : null),
                helperStyle: widget.helperText != null
                    ? context.text.captionDefault.copyWith(
                        color: context.appColors.infoDark,
                      )
                    : context.text.captionDefault.copyWith(height: .75),
                errorStyle: context.text.captionDefault.copyWith(
                  color: context.appColors.error,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        style: IconButton.styleFrom(
                          highlightColor: Colors.transparent,
                        ),
                        icon: AnimatedCrossFade(
                          firstChild: Icon(
                            Icons.visibility_outlined,
                            size: 20,
                            color: _isFocused
                                ? context.appColors.primary
                                : context.appColors.info,
                          ),
                          secondChild: Icon(
                            Icons.visibility_off_outlined,
                            size: 20,
                            color: _isFocused
                                ? context.appColors.primary
                                : context.appColors.info,
                          ),
                          crossFadeState: _obscureText
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 300),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                fillColor: Colors.transparent,
                hintText: widget.hint,
                hintStyle: context.text.captionDefault.copyWith(
                  color: _isFocused ? context.appColors.primary : null,
                ),
                contentPadding:
                    widget.contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 8),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.appColors.info,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.appColors.primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.appColors.info,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.appColors.error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.appColors.error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              cursorHeight: 20,
              style: context.text.bodyDefault,
            ),
          ),
        ),
      ],
    );
  }
}
