import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonGlobalWithoutIcon extends StatelessWidget {
  final String buttontext;
  final Decoration buttonDecoration;
  final onPressed;
  final Color buttonTextColor;

  const ButtonGlobalWithoutIcon({
    super.key,
    required this.buttontext,
    required this.buttonDecoration,
    required this.onPressed,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttontext,
              style: GoogleFonts.jost(fontSize: 20.0, color: buttonTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
