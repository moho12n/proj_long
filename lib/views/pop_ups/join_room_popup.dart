import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:proj_long/views/waiting_room/waitingRoomBefore.dart';

void showPopUpJoinRoom() {
  Get.dialog(Scaffold(
    backgroundColor: Colors.transparent,
    body: GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.30)),
        child: GestureDetector(
          onTap: () => print(''),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                color: Colors.white,
                width: SizeConfig.screenWidth * .9,
                height: SizeConfig.screenHeight * .32,
                child: Material(
                  textStyle: TextStyle(color: Colors.black),
                  color: ThemeColors.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: SizedBox(
                                width: SizeConfig.screenWidth,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: RichText(
                                            maxLines: 4,
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Rejoindre une salle",
                                                  style: TextStyle(
                                                    fontFamily: "Lora",
                                                    fontSize: 18,
                                                    color: Color(0xffeceded),
                                                  )),
                                              WidgetSpan(
                                                  child: Container(
                                                height: 10.0,
                                              )),
                                            ])),
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * .05),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          height: SizeConfig.screenHeight * .06,
                                          width: SizeConfig.screenWidth * .5,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(22.00),
                                              border: Border.all(
                                                  color: ThemeColors
                                                      .backgroundColorBlue)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white),
                                              cursorColor: Color(0xff5acfc3),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Id salle",
                                                  hintStyle: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14,
                                                    color: Colors.white
                                                        .withOpacity(0.1),
                                                  )),
                                              onChanged: (input) {},
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * .05),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Get.back();
                                            Get.to(WaitingRoomBefore());
                                          },
                                          child: Container(
                                              height: SizeConfig.screenHeight *
                                                  0.053,
                                              width:
                                                  SizeConfig.screenWidth * .355,
                                              decoration: BoxDecoration(
                                                color: ThemeColors.mainPink,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.00),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Rejoindre",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: "Montserrat",
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
