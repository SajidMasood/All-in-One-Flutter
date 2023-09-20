import 'package:flutter_internationalization_getx/view/screens/homescreen/home_screen.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  //
  /* -- MEMBER'S | INSTANCES OF CLASS */
  RxBool animate = false.obs;

  /*  -- START ANIMATION METHOD */
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;

    // await Future.delayed(Duration(milliseconds: 3000));
    // animate.value = false;
    
    // await Future.delayed(Duration(milliseconds: 2000));
    // Get.offAll( () => HomeScreen());

  }
}
