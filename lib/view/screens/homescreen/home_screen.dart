import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/controller/language_controller.dart';
import 'package:flutter_internationalization_getx/model/language_model.dart';
import 'package:flutter_internationalization_getx/view/widgets/my_text.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../constants/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _box = GetStorage();
  final _languageController = Get.put(LanguageController());
  LanguageModel? selectedLang;

  @override
  Widget build(BuildContext context) {
    selectedLang = _languageController.languageList[_languageController
        .languageList
        .indexWhere((i) => i.locale == Get.locale)];

    return Scaffold(
      appBar: _appBar(context),
      body: Center(
        child: Text(
          "home_screen".tr,
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      titleSpacing: 0,
      backgroundColor: kMainColor,
      elevation: 0.0,
      title: ListTile(
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.all(10.0),
        title: MyText(
          'Data',
          style: kTextStyle.copyWith(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.only(left: 8, right: 0),
          decoration: BoxDecoration(
            color: Colors.white, //<-- SEE HERE
          ),
          height: 25.0,
          child: DropdownButton<LanguageModel>(
            iconSize: 18,
            elevation: 16,
            value: selectedLang,
            style: const TextStyle(color: Colors.white),
            underline: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              color: Colors.transparent,
            ),
            onChanged: (newValue) async {
              setState(() {
                selectedLang = newValue!;
                if (newValue.langName == 'English') {
                  _languageController.changeLanguage("en");
                } else if (newValue.langName == 'Española') {
                  _languageController.changeLanguage("es");
                } else if (newValue.langName == 'Français') {
                  _languageController.changeLanguage("de");
                } else if (newValue.langName == 'العربية') {
                  _languageController.changeLanguage("ar");
                } else if (newValue.langName == 'اردو') {
                  _languageController.changeLanguage("ur");
                } else if (newValue.langName == 'हिंदी') {
                  _languageController.changeLanguage("hi");
                }
              });
            },
            items: _languageController.languageList
                .map<DropdownMenuItem<LanguageModel>>((value) {
              return DropdownMenuItem<LanguageModel>(
                value: value,
                child: MyText(
                  value.langName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
