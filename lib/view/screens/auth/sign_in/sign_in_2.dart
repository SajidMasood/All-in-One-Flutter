import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/screens/auth/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:get/get.dart';

import '../../../../constants/images_string.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_string.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/auth/header.dart';
import '../../../widgets/my_text.dart';
import '../../dashboard/dashboard.dart';

class SignIn2 extends StatelessWidget {
  const SignIn2({super.key});

  @override
  Widget build(BuildContext context) {
    /// GET DEVICE SIZE
    final size = MediaQuery.of(context).size;

    ///
    ///
    ///
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* -- SECTION 1 START */

                // Image(
                //   image: AssetImage(onBoardingImg_2),
                //   height: size.height * 0.2, // 2%
                // ),
                // MyText(tLoginTitle,
                //     style: Theme.of(context).textTheme.titleLarge),
                // MyText(tLoginSubTitle,
                //     style: Theme.of(context).textTheme.bodyLarge),
                HeaderWidget(
                  image: onBoardingImg_1,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                ),
                /* -- SECTION 1 END */
                ///
                ///
                /* -- SECTION 2 START */
                LoginForm(),
                /* -- SECTION 2 END */

                //
                /* -- SECTION 3 START */
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText("OR"),
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage(googleIcon),
                          width: 20.0,
                        ),
                        label: MyText(tSignInWithGoogle),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          text: tDontHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                              text: tSignup,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /* -- SECTION 3 END */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* -- TextFormField */
            AppTextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
              textFieldType: TextFieldType.EMAIL,
            ),
            SizedBox(height: 30),
            AppTextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: OutlineInputBorder()),
              textFieldType: TextFieldType.PASSWORD,
            ),
            SizedBox(height: 10),
            /* --FORGET PASSWORD BUTTON */
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  /* Create Bottom Sheet  */
                  buildShowModalBottomSheet(context);
                },
                child: MyText(tForgetPassword),
              ),
            ),

            /* LOGIN BUTTON */
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  log("----- Login Pressed -----");
                  Get.to(() => Dashboard());
                },
                child: MyText(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              tForgetPasswordTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            MyText(
              tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 30.0),

            /* bottom sheet btn */
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: tEmail,
              subTitle: tResetViaEMail,
              onTap: () {
                /* close sheet */
                Navigator.pop(context);
                /* then show other screen */
                Get.to(() => ForgotPasswordMailScreen());
              },
            ),
            SizedBox(height: 20.0),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: tPhoneNo,
              subTitle: tResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget({
    super.key,
    required this.btnIcon,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  /*  */
  final IconData btnIcon;
  final String title, subTitle;
  final VoidCallback onTap; // when click

  @override
  Widget build(BuildContext context) {
    /* to make it clickable container */
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 60.0),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                MyText(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
