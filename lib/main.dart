import 'package:flutter/material.dart';
import 'package:proj_long/views/authentification/login_screen.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: ThemeColors.mainPink,
          cursorColor: ThemeColors.mainPink,
          brightness: Brightness.light,
          scaffoldBackgroundColor: ThemeColors.backgroundColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: ThemeColors.backgroundColor),
          splashColor: ThemeColors.backgroundColorBlue,
          highlightColor: ThemeColors.backgroundColorBlue.withOpacity(0.3),
          backgroundColor: ThemeColors.backgroundColorBlue,
          textTheme: TextTheme(
            headline1: TextStyle(
                color: ThemeColors.headColor1,
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600),
            subtitle1: TextStyle(
                color: ThemeColors.headColor1,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w400),
            subtitle2: TextStyle(
                color: ThemeColors.backgroundColorLight,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w400),
            headline2: TextStyle(
                color: ThemeColors.headColor1,
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w600),
            bodyText1: TextStyle(
                color: ThemeColors.textColor2,
                fontFamily: 'Hind',
                fontSize: 12,
                fontWeight: FontWeight.w400),
            bodyText2: TextStyle(
              color: ThemeColors.backgroundColorLight,
              fontFamily: 'Hind',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            headline3: TextStyle(
                color: ThemeColors.textColor1,
                fontFamily: 'Hind',
                fontSize: 12,
                fontWeight: FontWeight.w400),
            headline4: TextStyle(
                color: ThemeColors.headColor1,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w600),
            headline5: TextStyle(
              color: ThemeColors.textColor2,
              fontFamily: 'Hind',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            headline6: TextStyle(
                color: ThemeColors.backgroundColorDark,
                fontFamily: 'Montserrat',
                fontSize: 12,
                fontWeight: FontWeight.w400),
            button: TextStyle(
                color: ThemeColors.headColor1,
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w600),
          )),
      routes: <String, WidgetBuilder>{},
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: ThemeColors.backgroundColor, body: LoginScreen()),
    );
  }
}
