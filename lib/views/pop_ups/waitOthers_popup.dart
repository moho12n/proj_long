import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proj_long/views/create_room/create_room_screen.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

void showPopUpWaitOthers() {
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
                height: SizeConfig.screenHeight * .22,
                child: Material(
                  textStyle: TextStyle(color: Colors.black),
                  color: ThemeColors.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
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
                                      Text("En attente des autres"),
                                      CircularProgressIndicator(),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * .05),
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

void showPopUpRoomCreated() {
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
                height: SizeConfig.screenHeight * .22,
                child: Material(
                  textStyle: TextStyle(color: Colors.black),
                  color: ThemeColors.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
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
                                                  text:
                                                      "Salle créer avec succès !",
                                                  style: TextStyle(
                                                    fontFamily: "Lora",
                                                    fontSize: 24,
                                                    color: ThemeColors.mainPink
                                                        .withOpacity(1),
                                                  )),
                                              WidgetSpan(
                                                  child: Container(
                                                height: 10.0,
                                              )),
                                            ])),
                                      ),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * .02),
                                      Center(
                                        child: InkWell(
                                          onTap: () {
                                            Clipboard.setData(
                                                ClipboardData(text: "203145"));
                                            Get.snackbar("Succès:", "ID copié",
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          },
                                          child: Container(
                                              height: SizeConfig.screenHeight *
                                                  0.053,
                                              width:
                                                  SizeConfig.screenWidth * .355,
                                              decoration: BoxDecoration(
                                                color: ThemeColors
                                                    .backgroundColorLight
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.00),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "203145",
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
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * .01),
                                      Center(
                                        child: Text("Cliquer pour copier id",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            )),
                                      ),
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
