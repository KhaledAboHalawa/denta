import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AuthTextBanner extends StatelessWidget {
  const AuthTextBanner({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .center,
      mainAxisSize: .min,
      children: [
        Text(
          title,
          style: context.text.heading1.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(subTitle, style: context.text.captionDefault, textAlign: .center),
      ],
    );
  }
}
