import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/constant.dart';
import 'package:flutter_internationalization_getx/utils/image.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';

import '../../widgets/app_text_field.dart';
import '../../widgets/button_global.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kMainColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  /* space from the top */
                  SizedBox(height: 40),

                  /* logo */
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      height: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Images.appLogo),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  /* Text */
                  MyText(
                    'Please enter your user information.',
                    style: kTextStyle.copyWith(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),

                  /* below white container */
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          // key: _formKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 20.0),
                              /* email/mobile field */
                              AppTextField(
                                textFieldType: TextFieldType.EMAIL,
                                controller: _emailController,
                                validator: (value) {
                                  if (_emailController.text.isEmpty) {
                                    return 'This field can\'t be empty';
                                  }
                                  return null;
                                },
                                cursorColor: kTitleColor,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'Email/Mobile*',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kTitleColor),
                                  hintText: 'sajidmaseed@gmail.com',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                  suffixIcon:
                                      Icon(Icons.mail, color: kGreyTextColor),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              /* password field */
                              AppTextField(
                                showCursor: true,
                                cursorColor: kTitleColor,
                                controller: _passwordController,
                                validator: (value) {
                                  if (_passwordController.text.isEmpty) {
                                    return "this field cant be empty";
                                  }
                                  return null;
                                },
                                textFieldType: TextFieldType.PASSWORD,
                                decoration: kInputDecoration.copyWith(
                                  labelText: 'password',
                                  labelStyle:
                                      kTextStyle.copyWith(color: kTitleColor),
                                  hintText: '********',
                                  hintStyle: kTextStyle.copyWith(
                                      color: kGreyTextColor),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              /* checkbox */
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    activeColor: kMainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                  ),
                                  Text(
                                    'remember me',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  // MyText(
                                  //   'forgot password',
                                  //   style: kTextStyle.copyWith(
                                  //     color: kMainColor, fontWeight: FontWeight.bold),
                                  //   ).onTap(
                                  //     () => const ForgotPassword().launch(context),
                                  //   ),
                                  MyText('Forgot Password'),
                                ],
                              ),
                              SizedBox(height: 30.0),
                              /* Sign In Button */
                              ButtonGlobal(
                                buttontext: 'Sign In',
                                buttonDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: kMainColor,
                                ),
                                onPressed: () {
                                  log('Butten Pressed');
                                },
                              ),
                              SizedBox(height: 10.0),
                              /* Don't have an account */
                              RichText(
                                text: TextSpan(
                                  text: 'dont have an account ?',
                                  style:
                                      kTextStyle.copyWith(color: kTitleColor),
                                  children: [
                                    TextSpan(
                                      text: 'Sign up here',
                                      style: kTextStyle.copyWith(
                                          color: kMainColor),
                                    ),
                                  ],
                                ), //.onTap(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /* Loading */
            // auth.loader
            //     ? Positioned(
            //         child: Container(
            //             height: MediaQuery.of(context).size.height,
            //             width: MediaQuery.of(context).size.width,
            //             color: Colors.white60,
            //             child: const Center(child: LoaderCircle())),
            //       )
            //     : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
