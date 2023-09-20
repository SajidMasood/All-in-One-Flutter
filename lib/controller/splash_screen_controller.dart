import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screens/homescreen/home_screen.dart';
import '../view/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {

  /*  */
  RxBool animate = true.obs;   
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() {
    
    animationInitilization();
    // checkLogin();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  animationInitilization() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    //
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //Get.off(() => HomeScreen());
        // Get.off(() => SignIn());
        // Get.off(() => OnBoardingScreen());
        Get.off(() => WelcomeScreen());
      }
    });
    //

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut)
            .obs
            .value;
    animation.addListener(() => update());
    animationController.forward();
  }

  void onSplashComplete() {
    Get.off(() => HomeScreen());
  }


  /* check Login */
}
