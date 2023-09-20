import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/view/screens/homescreen/home_screen.dart';
import 'package:flutter_internationalization_getx/view/screens/testads/test_ads.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'language/app_translations.dart';

import 'services/one_signal_service.dart';
import 'utils/theme/theme.dart';
import 'view/screens/splashscreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* it required by the depandency */
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  await GetStorage.init();
  final _box = GetStorage();
  // final one = OneSignalService();
  // one.initOnesignal();

  /* language */
  dynamic langValue = const Locale('en', 'US');
  if (_box.read('lang') != null) {
    langValue = Locale(_box.read('lang'), _box.read('langKey'));
  } else {
    langValue = const Locale('en', 'US');
  }

  runApp(MyApp(lang: langValue));
}

class MyApp extends StatefulWidget {
  final Locale lang;
  const MyApp({super.key, required this.lang});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final one = OneSignalService();
    one.OneSignalSService(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: OneSignalService.navigatorKey,
      translations: AppTranslations(),
      locale: widget.lang,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        '/home_screen': (_) => HomeScreen(),
        //'/test_ads': (_) => TestAds(postId: '',),
      },
    );
  }
}
