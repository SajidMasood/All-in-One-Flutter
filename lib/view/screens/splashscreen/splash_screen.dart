import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/controller/splash_screen_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constant.dart';
import '../../../utils/image.dart';
import '../../widgets/my_text.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    //splashController.run();
    return Scaffold(
      backgroundColor: kMainColor,
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image(
                  image: AssetImage(Images.appLogo),
                  width: controller.animation.value * 200,
                  height: controller.animation.value * 200,
                ),
              ),

              //
              SizedBox(height: 10),

              FadeTransition(
                opacity: controller.animation,
                child: Center(
                  child: MyText(
                    "Multi Pro App",
                    style: GoogleFonts.rubikMicrobe(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
