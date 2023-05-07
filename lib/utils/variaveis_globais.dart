import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VariaveisGlobais {
  static bool isDarkModeEnabled = true;

  // Cor principal
  static Color corPrimaria = Colors.white;

  // Cor Secundaria
  static Color corSecundaria = Colors.black;

  //
  // Outras Cores
  static Color corMaterialPrimaria = Color(0xffbb86fc);

  static Color corMaterialSecundaria = Color(0xff03dac5);

  static ThemeData tema(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ThemeData(
      brightness: Brightness.light,
      //
      //
      primaryColor: corPrimaria,
      //
      //
      accentColor: corSecundaria,
      //
      //
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: corSecundaria,
      ),
      //
      //
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //
      //
      scaffoldBackgroundColor: corPrimaria,
      //
      //
      fontFamily: 'Lato',
    );
  }

  static ThemeData temaDark(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return ThemeData(
      scaffoldBackgroundColor: corSecundaria,
//
//
      appBarTheme: AppBarTheme(brightness: Brightness.light),
      //
      //
      brightness: Brightness.dark,
      //
      //
      primaryColor: corSecundaria,
      //
      //
      accentColor: corPrimaria,
      //
      //
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: corPrimaria,
      ),
      //
      //
      visualDensity: VisualDensity.adaptivePlatformDensity,
      //
      //
      fontFamily: 'Lato',
      //
      //
      accentColorBrightness: Brightness.dark,
    );
  }
}
