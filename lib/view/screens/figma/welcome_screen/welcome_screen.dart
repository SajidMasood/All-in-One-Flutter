import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreenFigma extends StatelessWidget {
  const WelcomeScreenFigma({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  EdgeInsets.fromLTRB(31 * fem, 0 * fem, 0 * fem, 18.93 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
                    width: double.infinity,
                    height: 225 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 78 * fem, 48 * fem),
                          width: 22 * fem,
                          height: 21 * fem,
                          child: Image.asset(
                            'assets/images/figma/vector-Nhw.png',
                            width: 22 * fem,
                            height: 21 * fem,
                          ),
                        ),
                        Container(
                          width: 344 * fem,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 106 * fem,
                                top: 0 * fem,
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        39 * fem, 0 * fem, 0 * fem, 0 * fem),
                                    width: 238 * fem,
                                    height: 225 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0x60019874),
                                      borderRadius:
                                          BorderRadius.circular(99.5 * fem),
                                    ),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 199 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                99.5 * fem),
                                            color: Color(0x99019874),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // hellokzM (5:135)
                                left: 0 * fem,
                                top: 9 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 40 * fem,
                                    height: 23 * fem,
                                    child: Text(
                                      'Hello,',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0 * fem,
                                top: 32 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 112 * fem,
                                    height: 27 * fem,
                                    child: Text(
                                      'Emmanuel !',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.5 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 168 * fem,
                                top: 17 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 43 * fem,
                                    height: 43 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(21.5 * fem),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/images/figma/ellipse-2-bg.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
