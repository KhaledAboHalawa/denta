import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.onChange,
    required this.controller,
    this.isPassword = false,
    this.prefixIconPath,
    this.validator,
    this.canRequestFocus,
    required this.focusNode,
    this.onSubmitted,
    this.labelText,
  });
  final String hint;
  final String? labelText;
  final FocusNode focusNode;
  final void Function(String value)? onSubmitted;
  final bool? canRequestFocus;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final TextEditingController controller;
  final bool isPassword;
  final String? prefixIconPath;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        if (widget.labelText != null) Text(widget.labelText!),
        SizedBox(height: 6),
        SizedBox(
          height: 56,
          child: TextFormField(
            canRequestFocus: widget.canRequestFocus ?? true,
            validator: widget.validator,
            focusNode: widget.focusNode,
            onFieldSubmitted: widget.onSubmitted,
            onTapOutside: (event) => widget.focusNode.unfocus(),
            onChanged: widget.onChange,
            controller: widget.controller,
            obscureText: widget.isPassword && _obscureText,
            decoration: InputDecoration(
              floatingLabelBehavior: .never,
              helperText: " ",
              helperStyle: context.text.captionDefault.copyWith(height: .75),
              errorStyle: context.text.captionDefault.copyWith(
                color: context.appColors.error,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: AnimatedCrossFade(
                        firstChild: const Icon(
                          Icons.visibility_outlined,
                          size: 20,
                        ),
                        secondChild: const Icon(
                          Icons.visibility_off_outlined,
                          size: 20,
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
              prefixIconConstraints: const BoxConstraints(
                minWidth: 38,
                minHeight: 36,
              ),
              prefixIcon: widget.prefixIconPath != null
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16,
                        end: 2, // ← reduce this to close the gap between icon and label
                      ),
                      child: SvgPicture.asset(
                        widget.prefixIconPath!,
                        width: 20,
                        height: 20,
                      ),
                    )
                  : null,
              filled: true,
              fillColor: Colors.transparent,
              labelText: widget.hint,
              labelStyle: context.text.captionDefault,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.appColors.info,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.appColors.info,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.appColors.error,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            cursorHeight: 20,
            style: context.text.captionDefault.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
