import 'package:denta/core/widgets/custom_button.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widgets/auth/auth_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 35),
        AuthAppBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 37,
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    controller: TextEditingController(),
                    hint: 'Enter your First name here',
                    focusNode: FocusNode(),
                    labelText: 'First Name',
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: TextEditingController(),
                    hint: 'Enter your Last name here',
                    focusNode: FocusNode(),
                    labelText: 'Last Name',
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    controller: TextEditingController(),
                    hint: 'Enter your university email here',
                    focusNode: FocusNode(),
                    labelText: 'University E-mail',
                  ),
                  SizedBox(height: 24),
                  CustomButton(
                    title: 'Continue',
                    isLoading: false,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
