import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/authentication_controller.dart';
import 'package:login_app/src/features/authentication/models/user/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationController());
    final _formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail),
                    prefixIcon: Icon(Icons.email_outlined)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(height: tFormHeight - 20),
              TextFormField(
                controller: controller.password,
                obscureText: true, // hind password
                decoration: const InputDecoration(
                    label: Text(tPassword),
                    prefixIcon: Icon(Icons.fingerprint)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: tFormHeight - 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // AuthenticationController.instance.registerUser(
                      //     controller.email.text.trim(),
                      //     controller.password.text.trim());

                      // AuthenticationController.instance
                      //     .phoneAuthentication(controller.phoneNo.text.trim());
                      // Get.to(() => const OtpScreen());
                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                      );
                      AuthenticationController.instance.createUser(user);
                    }
                  },
                  child: Text(tSignup.toUpperCase()),
                ),
              )
            ],
          )),
    );
  }
}
