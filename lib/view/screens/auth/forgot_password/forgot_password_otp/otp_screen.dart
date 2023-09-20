import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/constants/text_string.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                tOTPTitle,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),
              ),
              MyText(
                tOTPSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 40.0),
              MyText(
                "$tOTPMessage support@masoodtech.com",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              /* depandency || firebase using 6 digit */
              OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  log("OTP CODE is => $code");
                },
              ),
              SizedBox(height: 20.0),

              /*  */
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: MyText(tNext),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
