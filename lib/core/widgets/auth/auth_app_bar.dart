import 'package:denta/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key, this.onlyLogo = false});

  final bool onlyLogo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        mainAxisAlignment: onlyLogo ? .center : .spaceBetween,
        children: [
          if (!onlyLogo)
            IconButton(
              iconSize: 20,
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_new),
              style: IconButton.styleFrom(
                tapTargetSize: .shrinkWrap,
                highlightColor: Colors.transparent,
              ),
            ),
          Image.asset(AppImages.logo, height: 34),
          if (!onlyLogo)
            const SizedBox(
              width: 40, // 20+2+20 width + left margin + icon size
            ),
        ],
      ),
    );
  }
}
