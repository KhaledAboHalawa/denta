import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';

class SlidShowSection extends StatefulWidget {
  const SlidShowSection({super.key, required this.currentPage});
  final int currentPage;

  @override
  State<SlidShowSection> createState() => _SlidShowSectionState();
}

class _SlidShowSectionState extends State<SlidShowSection> {
  bool _forward = true;
  bool _didPrecache = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didPrecache) return;
    _didPrecache = true;
    for (final path in AppImages.onBoardingSlides) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  void didUpdateWidget(covariant SlidShowSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      _forward = widget.currentPage > oldWidget.currentPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final direction = (_forward ? 1.0 : -1.0) * (isRtl ? -1.0 : 1.0);
    final currentKey = ValueKey<int>(widget.currentPage);

    return ClipRect(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 650),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        layoutBuilder: (currentChild, previousChildren) => Stack(
          fit: StackFit.expand,
          children: [...previousChildren, ?currentChild],
        ),
        transitionBuilder: (child, animation) {
          final isIncoming = child.key == currentKey;

          final slide = Tween<Offset>(
            begin: Offset(isIncoming ? direction * 0.12 : -direction * 0.12, 0),
            end: Offset.zero,
          ).animate(animation);

          final scale = Tween<double>(
            begin: isIncoming ? 1.06 : 1.0,
            end: 1.0,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: slide,
              child: ScaleTransition(scale: scale, child: child),
            ),
          );
        },
        child: Image.asset(
          AppImages.onBoardingSlides[widget.currentPage],
          key: currentKey,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
