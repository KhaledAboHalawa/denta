import 'package:denta/core/utils/app_images.dart';
import 'package:flutter/material.dart';

import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterBody(),
    );
  }
}
