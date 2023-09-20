import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/screens/figma/constants/texts.dart';
import 'package:flutter_internationalization_getx/view/screens/figma/sign_in_screen/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class SplashScreenFigma extends StatelessWidget {
  const SplashScreenFigma({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: fColorWhite,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(34.0, 60.0, 11.0, 59.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            // color: Colors.amberAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // .. section no 1
                topImageAndText(),
                // .. section no 2
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 40.0, 22.0, 24.0),
                  width: 307,
                  height: 228,
                  child: Image.asset(
                    'assets/images/figma/undrawdoctorshwty-2-1.png',
                    width: 308,
                    height: 228,
                  ),
                ),
                // .. section no 3
                Container(
                  margin: EdgeInsets.fromLTRB(14.87, 0, 0, 31),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 14, 49, 0),
                        constraints: BoxConstraints(maxWidth: 274),
                        child: Text(
                          'Consult Specialist Doctors \nSecurely And Privately',
                          textAlign: TextAlign.center,
                          style: googlePoppins20,
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 20,
                        child: Image.asset(
                          'assets/images/figma/vector-UR7.png',
                          width: 25,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // .. section no 4
                Container(
                  // margin: EdgeInsets.fromLTRB(0, 0, 13.13, 35),
                  constraints: BoxConstraints(
                    maxWidth: 255,
                  ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Malesuada vulputate facilisi eget neque, nunc suspendisse massa augue. Congue sit augue volutpat vel. Dictum dignissim ac pharetra.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.1725,
                      color: fColorBlack,
                    ),
                  ),
                ),
                // .. section no 5
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    log("----->Pressed Get Started<-----");
                    Get.to(() => SigninScreenFigma());
                  },
                  child: Container(
                    width: 308,
                    height: 58,
                    decoration: BoxDecoration(
                      color: fColorHeading,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: fColorWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container topImageAndText() {
    return Container(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/figma/vector-6Em.png',
            width: 56,
            height: 43,
          ),
          SizedBox(width: 9.0),
          Text(
            'CONSULT',
            textAlign: TextAlign.center,
            style: googlePoppins25,
          ),
        ],
      ),
    );
  }
}
