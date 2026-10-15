import 'package:denta/core/utils/app_validators.dart';
import 'package:denta/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/auth/auth_app_bar.dart';
import '../../../../core/widgets/auth/auth_divider.dart';
import '../../../../core/widgets/auth/auth_text_banner.dart';
import '../../../../core/widgets/auth/social_auth_section.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;

  late final List<FocusNode> nodes;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();

    nodes = [FocusNode(), FocusNode(), FocusNode()];
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    for (var node in nodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 35),
          const AuthAppBar(onlyLogo: false),
          const SizedBox(height: 34),
          const AuthTextBanner(
            title: "Create Account",
            subTitle: "Set up your profile and find the right care, nearby.",
          ),
          Expanded(
            child: SingleChildScrollView(
              hitTestBehavior: HitTestBehavior.opaque,
              keyboardDismissBehavior: .manual,
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.only(top: 37, left: 20, right: 20),
              child: Column(
                children: [
                  CustomTextField(
                    controller: firstNameController,
                    hint: 'Enter your First name here',
                    focusNode: nodes[0],
                    validator: (value) => AppValidators.validateName(value),
                    onSubmitted: (_) {
                      nodes[1].requestFocus();
                    },
                    labelText: 'First Name',
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: lastNameController,
                    hint: 'Enter your Last name here',
                    focusNode: nodes[1],
                    onSubmitted: (_) {
                      nodes[2].requestFocus();
                    },
                    labelText: 'Last Name',
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Enter your university email here',
                    focusNode: nodes[2],
                    onSubmitted: (_) {
                      nodes[2].unfocus();
                    },
                    labelText: 'University E-mail',
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    title: 'Continue',
                    isLoading: false,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 48),
                  const AuthDivider(title: 'Register'),
                  const SizedBox(height: 24),
                  const SocialAuthSection(),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.height -
                        (35 +
                            34 * 2 +
                            200 +
                            37 +
                            90 * 3 +
                            24 +
                            24 +
                            48 +
                            30 +
                            56 +
                            20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Sign in'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
