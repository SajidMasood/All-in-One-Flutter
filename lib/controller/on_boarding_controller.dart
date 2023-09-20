import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../constants/colors.dart';
import '../model/on_boarding_model.dart';
import '../utils/image.dart';
import '../view/widgets/on_boarding_page.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPage(
      model: OnBoardingModel(
        image: Images.tOnBoardingImage1,
        title: "title",
        subTitle: 'subTitle',
        counterText: '1/3',
        bgColor: tOnBoardingPage1Color,
      ),
    ),
    OnBoardingPage(
      model: OnBoardingModel(
        image: Images.tOnBoardingImage2,
        title: "title 2",
        subTitle: 'subTitle 2',
        counterText: '2/3',
        bgColor: tOnBoardingPage2Color,
      ),
    ),
    OnBoardingPage(
      model: OnBoardingModel(
        image: Images.tOnBoardingImage3,
        title: "title 3",
        subTitle: 'subTitle 3',
        counterText: '3/3',
        bgColor: tOnBoardingPage3Color,
      ),
    )
  ];

  // onPageChangedCallBack(int activePageIndex) {
  //   currentPage.value = activePageIndex;
  // }
  // 
  // send way
  onPageChangedCallBack(int activePageIndex) => currentPage.value = activePageIndex; 

  skip() => controller.jumpToPage(page: 2);

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
