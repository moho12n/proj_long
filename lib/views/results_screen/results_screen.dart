import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

class ResultsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: getHeight(64)),
            child: Align(
                alignment: Alignment.topCenter, child: restaurentElement()),
          ),
          SizedBox(
            height: getHeight(32),
          ),
          Padding(
            padding: EdgeInsets.only(left: getWidth(22), bottom: 12),
            child: personResultElement(imageSize: 64, name: "Moi"),
          ),
          Container(
            height: getHeight(272),
            child: Padding(
                padding:
                    EdgeInsets.only(left: getWidth(42), right: getWidth(56)),
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: personResultElement(name: "Mehdi Aknoun"));
                    })),
          )
        ],
      ),
    );
  }
}

Widget restaurentElement() {
  return Container(
    height: getHeight(226),
    width: getWidth(336),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              "https://www.eden-servon.fr/sites/default/files/2019-11/Trois%20tacos%20serviette.jpg"),
          fit: BoxFit.fill),
      borderRadius: BorderRadius.circular(28.00),
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.transparent,
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(28.00),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18, left: 24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 45,
              child: Image.network(
                  'https://static.takeaway.com/images/restaurants/fr/R00Q15R1/logo_465x320.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "O'tacos",
                style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xffeceded),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget personResultElement({double imageSize, String name}) {
  return Row(
    children: [
      Container(
        height: imageSize ?? 40.00,
        width: imageSize ?? 40.00,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.britannica.com/54/188754-050-A3613741/Elon-Musk-2010.jpg'),
              fit: BoxFit.fitWidth),
          border: Border.all(
            width: 2.00,
            color: Color(0xff2f3032).withOpacity(0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3), offset: Offset(-1, 1))
          ],
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(
        width: 12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name ?? "Unknown",
            style: TextStyle(
              fontFamily: "Raleway",
              fontSize: 10,
              color: Color(0xfffafafa),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 5,
            width: getWidth(180),
            child: FAProgressBar(
              currentValue: Random().nextInt(30) + 70,
              backgroundColor: ThemeColors.backgroundColorDark,
              progressColor: ThemeColors.mainPink,
            ),
          ),
        ],
      ),
    ],
  );
}
