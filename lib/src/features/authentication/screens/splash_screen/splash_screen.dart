// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_app/src/constants/color.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.starAnimationIn();

    return Scaffold(
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1500,
            animate: TAnimatePosition(
              topAfter: 5,
              topBefore: -30,
              leftAfter: 5,
              leftBefore: -30,
            ),
            child: const Image(image: AssetImage(tSplashTopIcon), width: 100),
          ),
          TFadeInAnimation(
            durationInMs: 1500,
            animate: TAnimatePosition(
              topBefore: 80,
              topAfter: 85,
              leftAfter: tDefaultSize,
              leftBefore: -80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tAppName, style: Theme.of(context).textTheme.headline3),
                Text(tAppTagLine, style: Theme.of(context).textTheme.headline2)
              ],
            ),
          ),
          TFadeInAnimation(
            durationInMs: 1500,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 100,
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(tSplashImage),
              ),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 1500,
            animate: TAnimatePosition(
                bottomBefore: 0,
                bottomAfter: 60,
                rightBefore: tDefaultSize,
                rightAfter: tDefaultSize),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
            ),
          )
          // Obx(
          //   () => AnimatedPositioned(
          //     duration: const Duration(milliseconds: 1700),
          //     bottom: splashController.animate.value ? 120 : 0,
          //     left: 20,
          // child: AnimatedOpacity(
          //   duration: const Duration(milliseconds: 1600),
          //   opacity: splashController.animate.value ? 1 : 0,
          //   child: const Image(
          //     image: AssetImage(tSplashImage),
          //   ),
          // ),
          //   ),
          // ),
          // Obx(
          //   () => AnimatedPositioned(
          //     duration: const Duration(milliseconds: 1700),
          //     bottom: splashController.animate.value ? 60 : 0,
          //     right: tDefaultSize,
          //     child: AnimatedOpacity(
          //       duration: const Duration(milliseconds: 1600),
          //       opacity: splashController.animate.value ? 1 : 0,
          //       child: Container(
          //         width: tSplashContainerSize,
          //         height: tSplashContainerSize,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(100),
          //           color: tPrimaryColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
