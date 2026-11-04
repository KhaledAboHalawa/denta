import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBarItem extends StatelessWidget {
  const CustomNavBarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.index,
    required this.onTap,
  });

  final int index;
  final String title;
  final String icon;
  final bool isSelected;
  final void Function(int index) onTap;

  static const double _iconSize = 24;
  static const double _pillHeight = 40;
  static const double _minTapSize = 48;
  static const double _pillHorizontalPadding = 9;
  static const double _gap = 6;
  static const Duration _duration = Duration(milliseconds: 250);
  static const Curve _curve = Curves.easeOutCubic;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final iconColor = isSelected ? colors.primary : colors.info;

    return Semantics(
      button: true,
      selected: isSelected,
      label: title,
      excludeSemantics: true,
      onTap: () => onTap(index),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: _minTapSize,
            minHeight: _minTapSize,
          ),
          child: Center(
            child: AnimatedContainer(
              duration: _duration,
              curve: _curve,
              constraints: const BoxConstraints(minHeight: _pillHeight),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: isSelected ? _pillHorizontalPadding : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: isSelected ? colors.secondary : colors.white,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: colors.primary.withValues(alpha: 0.35),
                          offset: const Offset(0, 3),
                          blurRadius: 3.5,
                        ),
                      ]
                    : const [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<Color?>(
                    tween: ColorTween(end: iconColor),
                    duration: _duration,
                    curve: _curve,
                    builder: (_, color, _) => SvgPicture.asset(
                      icon,
                      width: _iconSize,
                      height: _iconSize,
                      colorFilter: ColorFilter.mode(
                        color ?? iconColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Flexible(
                    child: AnimatedSize(
                      duration: _duration,
                      curve: _curve,
                      alignment: AlignmentDirectional.centerStart,
                      child: isSelected
                          ? Padding(
                              padding: const EdgeInsetsDirectional.only(
                                start: _gap,
                              ),
                              child: Text(
                                title,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: context.text.labelDefault.copyWith(
                                  color: colors.primary,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
