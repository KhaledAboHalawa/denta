import 'package:denta/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    super.key,
    required this.currentIndex,
    this.selected,
    this.unSelected,
  });
  final Color? selected;
  final Color? unSelected;
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
                ? selected ?? context.appColors.secondary
                : unSelected ?? context.appColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
