import 'package:flutter/material.dart';
import 'package:proj_long/matchMakingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: ThemeColors.mainBlue,
          cursorColor: ThemeColors.mainBlue,
          brightness: Brightness.light,
          splashColor: ThemeColors.backgroundColorBlue,
          highlightColor: ThemeColors.backgroundColorBlue.withOpacity(0.3),
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
                color: ThemeColors.backgroundColorAlpha,
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
      home: MatchMakingPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.mainBlue,
        body: Center(
          child: Hero(
              tag: 'vahkLogo',
              child:
                  Image(height: 56, image: AssetImage('assets/img/Vahk.png'))),
        ));
  }
}

// Colors
class ThemeColors {
  static const Color mainBlue = Color(0xff4d99fc);
  static const Color subBlue = Color(0xff3b91f0);
  static const Color darkBlue = Color(0xff3977d2);
  static const Color darkerBlue = Color(0xff074f8b);
  static const Color lightBlue = Color(0xff84a7fd);

  static const Color headColor1 = Color(0xFF152d4a);
  static const Color headColor2 = Color(0xFF338dfd);
  static const Color textColor1 = Color(0xFF788694);
  static const Color textColor2 = Color(0xFF96a2ae);
  static const Color iconColor = Color(0xFFefeeed);

  static const Color backgroundColorLight = Color(0xFFffffff);
  static const Color backgroundColorSoftLight = Color(0xFF37393B);
  static const Color backgroundColor = Color(0xFF1F2022);
  static const Color backgroundColorAlpha = Color(0xAAededed);
  static const Color backgroundColorBlue = Color(0xFFcddcef);

  static const Color disabledBackgroundSoft = Color(0xFFf7f7f7);
  static const Color disabledBackground = Color(0xFFf7f7f7);
}
