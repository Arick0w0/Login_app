// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/authentication_controller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tOtpTitle,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(
              tOtpSubTitle.toUpperCase(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: tFormHeight + 10),
            const Text("$tOtpMessage support@gmail.com",
                textAlign: TextAlign.center),
            const SizedBox(height: tFormHeight - 10),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                AuthenticationController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      AuthenticationController.instance.verifyOTP(otp);
                    },
                    child: const Text(tNext)))
          ],
        ),
      ),
    );
  }
}
