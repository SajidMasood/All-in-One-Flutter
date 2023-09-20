import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/constants/colors.dart';
import 'package:flutter_internationalization_getx/constants/images_string.dart';
import 'package:flutter_internationalization_getx/constants/size.dart';
import 'package:flutter_internationalization_getx/constants/text_string.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // variables
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      /* AppBar */
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.black),
        title:
            MyText(tAppName, style: Theme.of(context).textTheme.headlineMedium),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor,
            ),
            child: IconButton(
              onPressed: () {
                log("----- appbar icon pressed -----");
              },
              icon: Image(image: AssetImage(tUserProfileImage)),
            ),
          )
        ],
      ),
      /* Main Body  */
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDashboardPadding), //20
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(tDashboardTitle, style: txtTheme.bodyMedium),
              MyText(tDashboardHeading, style: txtTheme.displaySmall),
              SizedBox(height: tDashboardPadding), // 20
              // search box
              Container(
                decoration: BoxDecoration(
                  border: Border(left: BorderSide(width: 4.0)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(tDashboardSearch,
                        style: txtTheme.titleMedium
                            ?.apply(color: Colors.grey.withOpacity(0.5))),
                    Icon(Icons.mic, size: 25)
                  ],
                ),
              ),

              /* Categories */
              ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    // this sizeBox wrap with ListView
                    width: 170,
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: tDarkColor),
                          child: Center(
                            child: MyText(
                              "JS",
                              style: txtTheme.headline6
                                  ?.apply(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(
                                // overflow this column wrap it with flexible
                                "Java Script ass dac sdd asc",
                                style: txtTheme.headline6,
                                overflow: TextOverflow.ellipsis,
                              ),
                              MyText(
                                "10 Lessons",
                                style: txtTheme.bodyText2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
