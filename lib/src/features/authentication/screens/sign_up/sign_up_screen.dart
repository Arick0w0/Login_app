import 'package:flutter/material.dart';
import 'package:login_app/src/common_widgets/form/form_header_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/sign_up/widgets/signup_footer_widget.dart';
import 'package:login_app/src/features/authentication/screens/sign_up/widgets/signup_form_widget.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: tFormHeight + 10), // Height of AppBar

              FormHeaderWidget(
                  image: tWelcomeScreenImages,
                  title: tSignUpTitle,
                  subTitle: tStgnUpSubTitle),
              SignUpFormWidget(),
              SingUpFooter()
            ],
          ),
        ),
      ),
    );
  }
}
