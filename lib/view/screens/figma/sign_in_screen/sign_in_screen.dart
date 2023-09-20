import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/screens/figma/constants/texts.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/app_text_field.dart';
import '../constants/colors.dart';

class SigninScreenFigma extends StatelessWidget {
  const SigninScreenFigma({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SafeArea(
      child: Scaffold(
        backgroundColor: fColorWhite,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 690 * fem, //MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                /* top image + text CONSULT */
                Positioned(
                  top: 28 * fem,
                  left: 35 * fem,
                  child: SizedBox(
                    width: (118 + 56) * fem,
                    height: 43 * fem,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /* img */
                        Image.asset(
                          'assets/images/figma/vector-5sf.png',
                          width: 56,
                          height: 43,
                        ),
                        SizedBox(width: 10),
                        /* text CONSULT */
                        Text(
                          'CONSULT',
                          textAlign: TextAlign.center,
                          style: googlePoppins25,
                        ),
                      ],
                    ),
                  ),
                ),

                /* back container  */
                Positioned(
                  left: 0 * fem,
                  top: 85 * fem,
                  child: SizedBox(
                    width: 375 * fem,
                    height: 727 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        color: fSigninMain,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          /* Welcome back text */
                          SizedBox(height: 70),
                          Text(
                            'Welcome Back !',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),

                          /* Main Image */
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/figma/undrawmyappgrf2-1-1.png',
                              width: 229 * fem,
                              height: 172 * fem,
                            ),
                          ),

                          /* start Text form field */
                          SizedBox(height: 25),
                          Align(
                            child: Container(
                              width: 308 * fem,
                              height: 58 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: fColorWhite,
                              ),
                              child: Align(
                                alignment:
                                    Alignment.center, // hint text to be center
                                child: AppTextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter your email',
                                    contentPadding: EdgeInsets.only(left: 50.0),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  textStyle: GoogleFonts.roboto(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Color(0x70000000),
                                  ),
                                  textFieldType: TextFieldType.EMAIL,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            child: Container(
                              width: 308 * fem,
                              height: 58 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20 * fem),
                                color: fColorWhite,
                              ),
                              child: Align(
                                alignment:
                                    Alignment.center, // hint text to be center
                                child: AppTextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter your password',
                                    contentPadding: EdgeInsets.only(left: 50.0),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                  textStyle: GoogleFonts.roboto(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Color(0x70000000),
                                  ),
                                  textFieldType: TextFieldType.EMAIL,
                                ),
                              ),
                            ),
                          ),
                          /* end Text form field */

                          /* Forgot Password */
                          SizedBox(height: 20),
                          Text(
                            'Forgot Password',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.1725 * ffem / fem,
                              color: Color(0xff019874),
                            ),
                          ),

                          /* Sign in Button ... */
                          SizedBox(height: 20),
                          Align(
                            child: SizedBox(
                              width: 308 * fem,
                              height: 58 * fem,
                              child: TextButton(
                                onPressed: () {
                                  log("----->Sign In Pressed<-----");
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(20 * fem),
                                    color: fColorHeading,
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Sign In',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5 * ffem / fem,
                                        color: fColorWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          /* Dont have an account? */
                          SizedBox(height: 10),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.roboto(
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725 * ffem / fem,
                                color: Color(0xff019874),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Dont have an account?',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 18 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725 * ffem / fem,
                                    color: Color(0xff019874),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign Up',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /* side wali circles */
                Positioned(
                  left: 239 * fem,
                  top: -66 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        39 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: 238 * fem,
                    height: 225 * fem,
                    decoration: BoxDecoration(
                      color: Color(0x60019874), //fColorHeading,
                      borderRadius: BorderRadius.circular(99.5 * fem),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        width: double.infinity,
                        height: 199 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99.5 * fem),
                            color: Color(0x99019874),
                          ),
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
}
