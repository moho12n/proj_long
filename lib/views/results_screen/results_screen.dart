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
          Container(
            height: getHeight(272),
            child: Padding(
                padding:
                    EdgeInsets.only(left: getWidth(32), right: getWidth(56)),
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return personResultElement();
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

Widget personResultElement() {
  return Row(
    children: [
      Container(
        height: 62.00,
        width: 62.00,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5f47d4de7637290765bce495%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D1398%26cropX2%3D3908%26cropY1%3D594%26cropY2%3D3102'),
          ),
          border: Border.all(
            width: 2.00,
            color: Color(0xff2f3032).withOpacity(0),
          ),
          borderRadius: BorderRadius.circular(32.00),
        ),
      ),
      SizedBox(
        width: 12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mehdi Aknoun",
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
              currentValue: Random().nextInt(100),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    ],
  );
}
