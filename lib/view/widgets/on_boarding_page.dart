import 'package:flutter/material.dart';

import '../../constants/size.dart';
import '../../model/on_boarding_model.dart';
import 'my_text.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    /* device size for responsiveness */
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.4, // 50% of device screen
          ),
          Column(
            children: [
              MyText(
                model.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              MyText(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          MyText(
            model.counterText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }
}
