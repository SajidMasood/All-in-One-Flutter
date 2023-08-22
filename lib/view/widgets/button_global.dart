import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class ButtonGlobal extends StatelessWidget {
  final String buttontext;
  final Decoration buttonDecoration;
  final onPressed;

  ButtonGlobal({
    super.key,
    required this.buttontext,
    required this.buttonDecoration,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
        ),
        decoration: buttonDecoration,
        child: Center(
          child: Text(
            buttontext,
            style: kTextStyle.copyWith(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
