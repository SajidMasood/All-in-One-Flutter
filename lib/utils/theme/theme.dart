import 'package:flutter/material.dart';
import 'package:flutter_internationalization_getx/utils/theme/widget_themes/elevated_btn_theme.dart';
import 'package:flutter_internationalization_getx/utils/theme/widget_themes/outline_btn_theme.dart';
import 'package:flutter_internationalization_getx/utils/theme/widget_themes/text_field_theme.dart';

import 'widget_themes/text_theme.dart';

class AppTheme {
  /* private Constructor */
  AppTheme._();

  /* Static means calling without instance of a class */
  static ThemeData lightTheme = ThemeData(
    // primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    //
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
  );

  static ThemeData darkTheme = ThemeData(
    // primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutLinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    //
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
  );
}
