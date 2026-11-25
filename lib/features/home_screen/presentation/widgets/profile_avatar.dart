import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:denta/core/theme/app_colors.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_images.dart';
import '../../../questionnaire/domain/entities/verification_info_params.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key, this.imageUrl, required this.gender});
  final String? imageUrl;
  final Gender gender;
  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return CircleAvatar(
      radius: 35,
      backgroundColor: colors.primaryLight,
      child: ClipOval(
        child: imageUrl != null
            ? Skeleton.replace(
                height: 70,
                width: 70,
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  width: 70,
                  height: 70,
                  memCacheWidth: (MediaQuery.of(context).devicePixelRatio * 70)
                      .round(),
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Skeleton.leaf(
                        child: SizedBox(height: 70, width: 70),
                      ),
                  fit: BoxFit.cover,
                ),
              )
            : Image.asset(
                _getGenderImage(gender),
                width: 70,
                height: 70,
                cacheWidth: (MediaQuery.of(context).devicePixelRatio * 70)
                    .round(),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

String _getGenderImage(Gender gender) {
  int randomIndex = Random().nextInt(3);
  return AppImages.avatars[gender.name]![randomIndex];
}
