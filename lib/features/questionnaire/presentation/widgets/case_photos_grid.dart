import 'dart:io';

import 'package:denta/core/theme/app_colors.dart';
import 'package:denta/features/questionnaire/presentation/widgets/file_chip.dart';
import 'package:flutter/material.dart';

class CasePhotosGrid extends StatelessWidget {
  const CasePhotosGrid({
    super.key,
    required this.paths,
    required this.onRemove,
  });

  final List<String> paths;
  final ValueChanged<String> onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final path in paths)
          SizedBox(
            width: 72,
            height: 72,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(path),
                      fit: BoxFit.cover,
                      cacheWidth: 216,
                      errorBuilder: (_, _, _) => Container(
                        color: colors.secondary,
                        child: Icon(Icons.image_outlined, color: colors.primary),
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 4,
                  end: 4,
                  child: CircleCloseButton(onTap: () => onRemove(path)),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
