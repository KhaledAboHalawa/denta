import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.color,
    this.style,
  });
  final String title;
  final Color color;
  final TextStyle? style;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.only(top: 0),
        minimumSize: const Size(20, 0),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style:
            style ??
            context.text.labelDefault.copyWith(
              color: color,
              fontWeight: FontWeight.w800,
            ),
      ),
    );
  }
}
