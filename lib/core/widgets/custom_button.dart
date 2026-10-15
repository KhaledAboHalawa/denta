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
       
        onPressed: onPressed,
        child: isLoading
            ? CircularProgressIndicator()
            : Text(title, style: context.text.buttonDefault),
      ),
    );
  }
}
