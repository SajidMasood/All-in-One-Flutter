
import 'package:get/get.dart';

import 'arabic.dart';
import 'english.dart';
import 'french.dart';
import 'hindi.dart';
import 'spanish.dart';
import 'urdu.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': english,
        'es_ES': spanish,
        'de_DE': french,
        'ar_SA': arabic,
        'ur_PK': urdu,
        'hi_IN': hindi,
      };
}
