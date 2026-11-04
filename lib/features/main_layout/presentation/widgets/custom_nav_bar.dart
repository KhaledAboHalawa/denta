import 'package:denta/core/l10n/app_localizations.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:denta/features/main_layout/presentation/widgets/custom_nav_bar_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_icons.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int selectedIndex = 0;

  // Keep these equal to the values inside CustomNavBarItem.
  static const Duration _duration = Duration(milliseconds: 250);
  static const Curve _curve = Curves.easeOutCubic;

  // Pill = 9 padding + 24 icon + 6 gap + label + 9 padding.
  static const double _pillExtras = 9 + 24 + 6 + 9;
  static const double _minSlot = 48;

  static const List<String> _icons = [
    AppIcons.home,
    AppIcons.marketPlace,
    AppIcons.notification,
    AppIcons.profile,
  ];

  List<({String title, String icon})> _items(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      (title: l10n.navHome, icon: _icons[0]),
      (title: l10n.navMarket, icon: _icons[1]),
      (title: l10n.navNotifications, icon: _icons[2]),
      (title: l10n.navProfile, icon: _icons[3]),
    ];
  }

  double _labelWidth(BuildContext context, String text) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: context.text.labelDefault),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
      maxLines: 1,
    )..layout();
    final width = painter.width;
    painter.dispose();
    return width;
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 30, left: 20, right: 20),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.appColors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 9,
            color: context.appColors.primary.withAlpha(255 * 35 ~/ 100),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      height: 86,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final available = constraints.maxWidth;
          final others = items.length - 1;

          // Final width of the selected pill (fits its label).
          final pillWidth =
              (_labelWidth(context, items[selectedIndex].title) + _pillExtras)
                  .ceilToDouble()
                  .clamp(0.0, available - others * _minSlot)
                  .toDouble();

          // Unselected items share the remaining width equally.
          final slotWidth = (available - pillWidth) / others;

          return Row(
            children: [
              for (final (i, item) in items.indexed)
                AnimatedContainer(
                  duration: _duration,
                  curve: _curve,
                  width: i == selectedIndex ? pillWidth : slotWidth,
                  child: CustomNavBarItem(
                    title: item.title,
                    icon: item.icon,
                    isSelected: i == selectedIndex,
                    index: i,
                    onTap: (index) {
                      widget.pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                      setState(() => selectedIndex = index);
                    },
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
