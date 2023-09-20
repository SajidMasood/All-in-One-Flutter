import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';


class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
  });

  /* member's */
  final Color? imageColor;
  final double? heightBetween;
  final String image, title, subTitle;
  final double imageHeight;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          color: imageColor,
          height: size.height * imageHeight, // 2%
        ),
        SizedBox(height: heightBetween),
        MyText(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        MyText(
          subTitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
