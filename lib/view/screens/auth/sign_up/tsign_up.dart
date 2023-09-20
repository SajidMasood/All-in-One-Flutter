import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/constants/text_string.dart';
import 'package:flutter_internationalization_getx/view/widgets/auth/header.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/images_string.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/my_text.dart';

class TSignUp extends StatelessWidget {
  TSignUp({super.key});

  /*  */
  // final TextEditingController _emailController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /* -- SECTION NO 1 START */
                HeaderWidget(
                  image: onBoardingImg_2,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                ),
                /* -- SECTION NO 1 END */

                /* -- SECTION NO 2 START */
                SignUpWidget(),
                /* -- SECTION NO 2 END */

                /* -- SECTION NO 3 START */
                Column(
                  children: [
                    MyText('OR'),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: Image(
                          image: AssetImage(googleIcon),
                          width: 20.0,
                        ),
                        label: MyText(tSignInWithGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: tAlreadyHaveAnAccount,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            TextSpan(text: tLogin.toUpperCase()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                /* -- SECTION NO 3 END */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* full name default */
            TextFormField(
              decoration: InputDecoration(
                label: MyText(tFullName),
                hintText: tFullName,
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            SizedBox(height: 10.0),

            /* email custom */
            AppTextField(
              showCursor: true, //
              cursorColor: tSecondaryColor,
              /* validator: (value) {
                if (_emailController.text.isEmpty) {
                  return 'abc@yahoo.com';
                }
                return null;
              }, */
              textFieldType: TextFieldType.EMAIL,
              decoration: InputDecoration(
                label: MyText(tEmail),
                hintText: 'abc@gmail.com',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            SizedBox(height: 10.0),

            /* phone custom */
            AppTextField(
              textFieldType: TextFieldType.PHONE,
              decoration: InputDecoration(
                label: MyText(tPhoneNo),
                hintText: '+92 301 xxxx xxx',
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            SizedBox(height: 10.0),

            /* password custom */
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              decoration: InputDecoration(
                label: MyText(tPassword),
                hintText: '********',
                prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            SizedBox(height: 10.0),
            // agr full with dena ho tu wrap kare
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: MyText(tSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
