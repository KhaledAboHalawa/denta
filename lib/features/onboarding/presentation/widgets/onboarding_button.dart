import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';

class OnboardingActionButton extends StatelessWidget {
  const OnboardingActionButton({
    super.key,
    required this.isRect,
    required this.onPressed,
    required this.label, // l10n.onboardingExploreDenta
  });

  final bool isRect;
  final VoidCallback onPressed;
  final String label;

  static const _circleSize = 67.0;
  static const _expandedHeight = 48.0;
  static const _duration = Duration(milliseconds: 450);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Semantics(
          button: true,
          label: isRect ? label : null,
          child: GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              duration: _duration,
              curve: Curves.easeInOutCubic,
              width: isRect ? constraints.maxWidth : _circleSize,
              height: isRect ? _expandedHeight : _circleSize,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(isRect ? 12 : 100),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.8, end: 1).animate(animation),
                    child: child,
                  ),
                ),
                child: isRect
                    ? Text(
                        label,
                        key: const ValueKey('label'),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.clip,
                        style: context.text.bodyLarge.copyWith(
                          color: context.appColors.primary,
                        ),
                      )
                    : Icon(
                        Icons.chevron_right_rounded,
                        key: const ValueKey('icon'),
                        size: 47,
                        color: context.appColors.primary,
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
