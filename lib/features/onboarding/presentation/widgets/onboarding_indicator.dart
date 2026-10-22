import 'package:denta/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) {
        final isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isSelected ? 28 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: isSelected
                ? context.appColors.secondary
                : context.appColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
