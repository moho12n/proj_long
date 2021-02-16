// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_long/views/preferences/preferences_page.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../matchMakingPage.dart';

class WaitingRoomBefore extends StatefulWidget {
  @override
  _WaitingRoomState createState() => _WaitingRoomState();
}

class Person {
  String name;
  String pseudo;

  Person({this.name, this.pseudo});
}

List list = [
  Person(name: "Mehdi", pseudo: "medi_16"),
  Person(name: "Mohamed", pseudo: "moho12n"),
  Person(name: "Ryad", pseudo: "Boukersha")
];

class _WaitingRoomState extends State<WaitingRoomBefore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: getHeight(40)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(20)),
                if (list.length == 0)
                  Center(
                      child: Column(
                    children: [
                      Text("Waiting for people to join",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff37393B))),
                      CircularProgressIndicator(
                        strokeWidth: 1,
                        semanticsLabel: "Hello world",
                      )
                    ],
                  ))
                else
                  Text("Présents maintenant : ",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8))),
                Container(
                    height: 570,
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                            title: Text(
                              list[index].name,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              list[index].pseudo,
                              // pair.asPascalCase,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            leading: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 44,
                                maxHeight: 44,
                              ),
                              child: CircleAvatar(
                                  backgroundColor: Colors.blueGrey.shade700,
                                  child: Text('D')),
                            ),
                            trailing: Icon(
                              Icons.check_rounded,
                              color: Colors.green,
                            ));
                      },
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: InkWell(
                  onTap: () {
                    Get.to(MatchMakingPage());
                  },
                  child: Container(
                      height: SizeConfig.screenHeight * 0.053,
                      width: SizeConfig.screenWidth * .355,
                      decoration: BoxDecoration(
                        color: ThemeColors.mainPink,
                        borderRadius: BorderRadius.circular(12.00),
                      ),
                      child: Center(
                        child: Text(
                          "Commencer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}

void onButtonPressed() {
  list.length == 0 ? null : print("hello");
}
