import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLoading,
    this.onPressed,
    required this.title,
    this.shrink = false,
    this.backgroundColor,
    this.foregroundColor,
  });
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final bool shrink;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: shrink ? null : double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(
            color: onPressed == null
                ? Colors.transparent
                : backgroundColor ?? context.appColors.primary,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
                constraints: const BoxConstraints(minWidth: 23, minHeight: 23),
              )
            : Text(
                title,
                style: context.text.buttonDefault.copyWith(
                  color: foregroundColor,
                ),
              ),
      ),
    );
  }
}
