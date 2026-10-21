import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLoading,
    this.onPressed,
    required this.title,
    this.shrink = false,
  });
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
          side: BorderSide(
            color: onPressed == null
                ? Colors.transparent
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
                constraints: BoxConstraints(minWidth: 23, minHeight: 23),
              )
            : Text(title, style: context.text.buttonDefault),
      ),
    );
  }
}
