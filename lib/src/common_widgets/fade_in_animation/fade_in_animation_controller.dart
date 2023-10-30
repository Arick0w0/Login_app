import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
// import 'package:login_app/src/features/authentication/screens/on%20boarding/on_boarding_screen.dart';

import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future starAnimationIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(const Duration(milliseconds: 1200));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 1200));

    Get.offAll(() => const WelcomeScreen());
  }

  Future starAnimationOut() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }
}






    // Get.to(WelcomeScreen());   function in man sa mard kup na jor kao dai 
