import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/controller/splash_screen_controller.dart';
import 'package:get/get.dart';

import '../../../constants/images_string.dart';
import '../../../controller/fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    this.tAnimationModel,
    required this.child,
  });

  final _fadeInAnimatedController = Get.put(FadeInAnimationController());
  final int durationInMs;
  // model class
  final TAnimationModel? tAnimationModel;
  // custom child using in Animated Opacity.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: _fadeInAnimatedController.animate.value ? tAnimationModel!.topAfter : tAnimationModel!.topBefore,
        right: _fadeInAnimatedController.animate.value ? tAnimationModel!.rightAfter : tAnimationModel!.rightBefore,
        bottom: _fadeInAnimatedController.animate.value ? tAnimationModel!.bottomAfter : tAnimationModel!.bottomBefore,
        left: _fadeInAnimatedController.animate.value ? tAnimationModel!.leftAfter : tAnimationModel!.leftBefore,

        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: _fadeInAnimatedController.animate.value ? 1 : 0,
          // child: Image(image: AssetImage(tSplashTopImage)),
          child: child,
        ),
      ),
    );
  }
}
