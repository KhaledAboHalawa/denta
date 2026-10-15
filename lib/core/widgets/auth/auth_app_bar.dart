import 'package:denta/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 20,
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            tapTargetSize: .shrinkWrap,
            highlightColor: Colors.transparent,
          ),
        ),
        Image.asset(AppImages.logo, height: 32),
        const SizedBox(
          width: 42, // 20+2+20 width + left margin + icon size + icon margin
        ), 
      ],
    );
  }
}
