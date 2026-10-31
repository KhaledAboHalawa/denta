import 'package:denta/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, this.onlyLogo = false, this.onBack});
  final bool onlyLogo;
  final VoidCallback? onBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 35,
        left: Directionality.of(context) == .ltr ? 5 : 0,
        right: Directionality.of(context) == .rtl ? 5 : 0,
        bottom: 34,
      ),
      child: SizedBox(
        height: 34,
        child: Row(
          mainAxisAlignment: onlyLogo ? .center : .spaceBetween,
          children: [
            if (!onlyLogo)
              IconButton(
                iconSize: 20,
                onPressed: onBack,

                icon: const Icon(Icons.arrow_back_ios_new),
                style: IconButton.styleFrom(
                  tapTargetSize: .shrinkWrap,
                  highlightColor: Colors.transparent,
                ),
              ),
            Image.asset(
              AppImages.logo,
              height: 34,
              cacheHeight: (34 * MediaQuery.of(context).devicePixelRatio)
                  .round(),
            ),
            if (!onlyLogo)
              const SizedBox(
                width:
                    45, // 20+2+20+5 width + left margin + icon size + padding
              ),
          ],
        ),
      ),
    );
  }
}
