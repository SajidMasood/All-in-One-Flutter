import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/language_model.dart';

class  LanguageController extends GetxController{
  final _box = GetStorage();

  /* List of Language */
  List<LanguageModel>  languageList = [
    LanguageModel(locale: const Locale('en', 'US'), langName: 'English'),
    LanguageModel(locale: const Locale('es', 'ES'), langName: 'Española'),
    LanguageModel(locale: const Locale('de', 'DE'), langName: 'Français'),
    LanguageModel(locale: const Locale('ar', 'SA'), langName: 'العربية'),
    LanguageModel(locale: const Locale('ur', 'PK'), langName: 'اردو'),
    LanguageModel(locale: const Locale('hi', 'IN'), langName: 'हिंदी'),
  ];


  /* Change Language */
  changeLanguage(String value){
    if (value == 'en'){
      _box.write('lang', value);  // 'lang':'en'
      _box.write('langKey', 'US');// 'langKey':'US' 
      _box.write('selectedValue', 'English'); // 'selectedValue':'English'
      Get.updateLocale(Locale('en', 'US'));
      update();
    } else if(value == 'es'){
      _box.write('lang', value);
      _box.write('langKey', 'ES');
      _box.write('selectedValue', 'Española');
      Get.updateLocale(Locale('es', 'ES'));
      update();
    } else if(value == 'de'){
      _box.write('lang', value);
      _box.write('langKey', 'DE');
      _box.write('selectedValue', 'Français');
      Get.updateLocale(Locale('de', 'DE'));
      update();
    } else if(value == 'ar'){
      _box.write('lang', value);
      _box.write('langKey', 'SA');
      _box.write('selectedValue', 'العربية');
      Get.updateLocale(Locale('ar', 'SA'));
      update();
    } else if(value == 'ur'){
      _box.write('lang', value);
      _box.write('langKey', 'PK');
      _box.write('selectedValue', 'اردو');
      Get.updateLocale(Locale('ur', 'PK'));
      update();
    } else if(value == 'hi'){
      _box.write('lang', value);
      _box.write('langKey', 'IN');
      _box.write('selectedValue', 'हिंदी');
      Get.updateLocale(Locale('hi', 'IN'));
      update();
    }
  }
}