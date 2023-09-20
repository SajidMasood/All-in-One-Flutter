import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/images_string.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/constants/text_string.dart';
import 'package:flutter_internationalization_getx/view/screens/auth/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:flutter_internationalization_getx/view/widgets/app_text_field.dart';
import 'package:flutter_internationalization_getx/view/widgets/auth/header.dart';
import 'package:get/get.dart';

import '../../../../widgets/my_text.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        /*  */
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                SizedBox(height: tDefaultSize * 4),
                /* header widget custom created */
                HeaderWidget(
                  image: tForgotPasswordImage,
                  title: tForgetPassword,
                  subTitle: tForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.0),
                Form(
                  child: Column(
                    children: [
                      AppTextField(
                        textFieldType: TextFieldType.EMAIL,
                        decoration: InputDecoration(
                          label: MyText(tEmail),
                          hintText: tEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => OTPScreen());
                          },
                          child: MyText(tNext),
                        ),
                      ),
                    ],
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
