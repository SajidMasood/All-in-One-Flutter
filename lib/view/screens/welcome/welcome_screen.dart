import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/constants/text_string.dart';
import 'package:flutter_internationalization_getx/view/screens/auth/sign_up/tsign_up.dart';
import 'package:flutter_internationalization_getx/view/screens/figma/splash_screen/splash_screen_figma.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controller/fade_in_animation_controller.dart';
import '../../../utils/image.dart';
import '../../widgets/fade_in_animation/animation_design.dart';
import '../../widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../widgets/my_text.dart';
import '../auth/sign_in/sign_in_2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* -- USING MEDIAQUERY */
    var _mediaQuery = MediaQuery.of(context);
    var height = _mediaQuery.size.height;
    var _brightness = _mediaQuery.platformBrightness;
    final isDarkMode = _brightness == Brightness.dark;

    //
    final _fadeAnimatedController = Get.put(FadeInAnimationController());
    _fadeAnimatedController.startAnimation();
    //
    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,

      /*  */
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            tAnimationModel: TAnimationModel(
              bottomAfter: 0,
              bottomBefore: -100,
              leftBefore: 0,
              leftAfter: 0,
              topAfter: 0,
              topBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
            ),
            child: Container(
              padding: EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        log("Figma text Click");
                        Get.to(() => SplashScreenFigma());
                      },
                      child: MyText("Figma Design")),
                  Image(
                    image: AssetImage(Images.tOnBoardingImage3),
                    height: height * 0.6, // 60%
                  ),
                  Column(
                    children: [
                      MyText(tWelcomeTitle,
                          style: Theme.of(context).textTheme.titleLarge),
                      MyText(
                        tWelcomeSubTitle,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Get.to(() => SignIn2()),
                        child: MyText("Login".toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => TSignUp()),
                        child: MyText("Sign up".toUpperCase()),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
