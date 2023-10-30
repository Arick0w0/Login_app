// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/src/features/authentication/screens/sign_up/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.starAnimationOut();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: const AssetImage(tWelcomeScreenImages),
                  height: height * 0.6,
                ),
                Column(
                  children: [
                    Text(
                      tWelcomeTitle,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      tWelcomeSubTitle,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => const LoginScreen()),
                        child: Text(
                          tLogin.toUpperCase(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const SingUpScreen()),
                        child: Text(tSignup.toUpperCase()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}




// // ignore_for_file: deprecated_member_use

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:login_app/src/common_widgets/fade_in_animation/animation_design.dart';
// import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
// import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
// import 'package:login_app/src/constants/color.dart';
// import 'package:login_app/src/constants/image_strings.dart';
// import 'package:login_app/src/constants/sizes.dart';
// import 'package:login_app/src/constants/text_strings.dart';
// import 'package:login_app/src/features/authentication/screens/login/login_screen.dart';
// import 'package:login_app/src/features/authentication/screens/sign_up/sign_up_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(FadeInAnimationController());
//     controller.starAnimationOut();

//     var mediaQuery = MediaQuery.of(context);
//     var height = mediaQuery.size.height;
//     var brightness = mediaQuery.platformBrightness;
//     final isDarkMode = brightness == Brightness.dark;
//     return Scaffold(
//       backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
//       body: Stack(
//         children: [
//           TFadeInAnimation(
//             durationInMs: 100,
//             animate: TAnimatePosition(
//               bottomAfter: 0,
//               bottomBefore: -100,
//               leftBefore: 0,
//               leftAfter: 0,
//               topBefore: 0,
//               topAfter: 0,
//               rightAfter: 0,
//               rightBefore: 0,
//             ),
//             child: Container(
//               padding: const EdgeInsets.all(tDefaultSize),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image(
//                     image: const AssetImage(tWelcomeScreenImages),
//                     height: height * 0.6,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         tWelcomeTitle,
//                         style: Theme.of(context).textTheme.headline4,
//                       ),
//                       Text(
//                         tWelcomeSubTitle,
//                         style: Theme.of(context).textTheme.bodyText1,
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () => Get.to(() => const LoginScreen()),
//                           child: Text(
//                             tLogin.toUpperCase(),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () => Get.to(() => const SingUpScreen()),
//                           child: Text(tSignup.toUpperCase()),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
