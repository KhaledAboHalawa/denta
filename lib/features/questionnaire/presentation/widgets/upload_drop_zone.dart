import 'dart:math' as math;

import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadDropZone extends StatelessWidget {
  const UploadDropZone({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.onTap,
    this.dashed = true,
    this.hasError = false,
  });

  final String iconAsset;
  final String label;
  final VoidCallback onTap;
  final bool dashed;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final borderColor = hasError
        ? colors.error
        : (dashed ? colors.primary : colors.primaryBorder);

    final content = Row(
      mainAxisSize: dashed ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 8),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            iconAsset,
            width: 17,
            height: 17,
            colorFilter: ColorFilter.mode(colors.primary, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            label,
            style: context.text.labelDefault.copyWith(color: colors.primary),
          ),
        ),
      ],
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: CustomPaint(
        foregroundPainter: dashed
            ? _DashedBorderPainter(color: borderColor, radius: 8)
            : null,
        child: Container(
          width: double.infinity,
          padding: dashed
              ? const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
              : const EdgeInsetsDirectional.only(
                  start: 12,
                  end: 16,
                  top: 16,
                  bottom: 16,
                ),
          decoration: BoxDecoration(
            color: colors.secondaryLight,
            borderRadius: BorderRadius.circular(8),
            border: dashed ? null : Border.all(color: borderColor, width: 0.8),
          ),
          child: dashed ? Center(child: content) : content,
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
          Radius.circular(radius),
        ),
      );
    const dash = 6.0;
    const gap = 4.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorderPainter old) =>
      old.color != color || old.radius != radius;
}
