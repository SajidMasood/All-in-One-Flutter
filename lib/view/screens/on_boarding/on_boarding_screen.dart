import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/colors.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/controller/on_boarding_controller.dart';
import 'package:flutter_internationalization_getx/model/on_boarding_model.dart';
import 'package:flutter_internationalization_getx/utils/image.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _onBoardingController = OnBoardingController();
    //
    //
    /* On Boarding Page List */

    return Scaffold(
      /* body  */
      body: Stack(
        alignment: Alignment.center,
        children: [
          /* Liquad slide */
          LiquidSwipe(
            /* we creating three pages */
            pages: _onBoardingController.pages,
            liquidController: _onBoardingController.controller,
            onPageChangeCallback: _onBoardingController.onPageChangedCallBack,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),

          /* Circular Button Animate to Next Slide  */
          Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () => _onBoardingController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                foregroundColor: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: tDarkColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),

          /* Skip Button */
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => _onBoardingController.skip(),
              child: MyText(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),

          /*  Animated Smooth Indicator in bottom */
          // its observer so wrap it
          Obx( () => Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                activeIndex: _onBoardingController.currentPage.value,
                count: _onBoardingController.pages.length, //3
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
