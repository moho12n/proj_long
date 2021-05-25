import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_long/views/pop_ups/waitOthers_popup.dart';
import 'package:proj_long/views/results_screen/results_screen.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'main.dart';
import 'matchCard.dart';
import 'package:get/get.dart';

class MatchMakingPage extends StatefulWidget {
  @override
  _MatchMakingPageState createState() => _MatchMakingPageState();
}

class _MatchMakingPageState extends State<MatchMakingPage> {
  List<Widget> _cardList = [];
  double angle = 0.0;
  var listElements = [
    CardContainer(
      imageLink:
          "https://www.parismarais.com/img/medias/8528/original/niji%20-%203-01.jpg",
      logoLink: null,
      price: "6.99",
      distance: "0.8",
      name: "Sushiko",
    ),
    CardContainer(
      logoLink:
          "https://pbs.twimg.com/profile_images/879963999034634240/1nivJg7U_400x400.jpg",
      imageLink:
          "https://ws.mcdonalds.fr/media/f2/06/99/f206996b0d82b3293e5c587d696a4d45865a672e",
      price: "3.0",
      distance: "0.7",
      name: "McDonalds",
    ),
    CardContainer(
      imageLink:
          "https://img.freepik.com/vecteurs-libre/icone-illustration-dessin-anime-plat-isole-nourriture-chinoise-isole-blanc-boite-nouilles-recette-originale-baguettes-nouilles-wok-logo-cuisine-chinoise_92289-504.jpg?size=626&ext=jpg",
      logoLink: null,
      price: "7.00",
      distance: "1.7",
      name: "ChukaFood",
    ),
    CardContainer(
      imageLink:
          "https://media-exp1.licdn.com/dms/image/C561BAQEOZvU-eFQyKg/company-background_10000/0?e=2159024400&v=beta&t=wQbiXWILniPxWcvD3THV5nWEmuDRGa7npFeGLd3FS2w",
      logoLink:
          "https://s3-eu-west-1.amazonaws.com/talentview/uploads/company/logo/Ppkn7YMlR5mIRyZI9fNQ_1529568703841.png",
      price: "4.99",
      distance: "1.1",
      name: "Otacos",
    ),
    CardContainer(
      imageLink:
          "https://resize.prod.femina.ladmedia.fr/rblr/652,438/img/var/2018-09/restaurant-chinois.jpg",
      logoLink: null,
      price: "6.99",
      distance: "3.1",
      name: "moommam",
    ),
    CardContainer(
      imageLink:
          "https://www.lejauresdecines.fr/sites/b757d718/files/styles/soref_diapo/public/soref/images/120959661_s.jpg?itok=1p7WQBHt",
      logoLink: null,
      price: "8.99",
      distance: "3.7",
      name: "Mamma Nissa",
    ),
  ];
  // this is just for prototyping
  bool load;

  @override
  void initState() {
    super.initState();
    load = true;
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {
        load = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ThemeColors.backgroundColor,
        body: SafeArea(
            child: Column(children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Salle 021498",
            style: TextStyle(
              fontFamily: "Lora",
              fontSize: 32,
              color: Color(0xffeceded),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Column(children: <Widget>[
              SizedBox(
                height: 24,
              ),
              (load || listElements.isEmpty)
                  ? Container(
                      height: (MediaQuery.of(context).size.width - 64) * 3 / 4,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        backgroundColor: ThemeColors.backgroundColor,
                        strokeWidth: 3,
                      ),
                    )
                  : LayoutBuilder(builder: (context, contraints) {
                      _cardList = [];
                      for (int i = 0; (i < listElements.length); i++)
                        _cardList.add(MatchCard(
                            index: i,
                            angle: (i == 0) ? angle : 0,
                            width: MediaQuery.of(context).size.width - 64,
                            child: listElements[i]));
                      _cardList.add(Container(
                        width: MediaQuery.of(context).size.width - 64,
                        height:
                            (MediaQuery.of(context).size.width - 64) * 3 / 4,
                      ));
                      return Stack(
                        children: List.from(_cardList.reversed),
                      );
                    }),
              SizedBox(
                height: 24,
              ),
            ]),
          ),
          SizedBox(
            height: 24,
          ),
          // Here are the accept and reject buttons
          Row(
            children: <Widget>[
              Spacer(),
              // Reject
              Column(
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ThemeColors.backgroundColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FloatingActionButton(
                      heroTag: "rjctBtn",
                      splashColor: ThemeColors.backgroundColorBlue,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      tooltip: "Get back to the previous page",
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Transform.rotate(
                          angle: angle,
                          child: Icon(
                            Icons.close,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.blueGrey,
                      elevation: 8,
                      onPressed: () {
                        setState(() {
                          angle = 1.0;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() async {
                            listElements.remove(listElements[0]);
                            if (listElements.isEmpty) {
                              await Future.delayed(Duration(seconds: 10), () {
                                showPopUpWaitOthers();
                              });
                              Get.to(ResultsScreen());
                            }
                            angle = .0;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 64,
              ),
              // Accept
              Column(
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FloatingActionButton(
                      heroTag: "acptSuperBtn",
                      splashColor: ThemeColors.backgroundColorBlue,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      tooltip: "Get back to the previous page",
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Icon(Icons.favorite_sharp,
                            size: 28, color: Colors.white),
                      ),
                      backgroundColor: Colors.blue,
                      elevation: 8,
                      onPressed: () {
                        setState(() {
                          angle = -10.1;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() async {
                            listElements.remove(listElements[0]);
                            if (listElements.isEmpty) {
                              await Future.delayed(Duration(seconds: 5), () {
                                showPopUpWaitOthers();
                              });
                              Get.to(ResultsScreen());
                            }
                            angle = .0;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: <Widget>[
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: ThemeColors.backgroundColorLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: FloatingActionButton(
                      heroTag: "acptBtn",
                      splashColor: ThemeColors.backgroundColorBlue,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      tooltip: "Get back to the previous page",
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child:
                            Icon(Icons.thumb_up, size: 28, color: Colors.white),
                      ),
                      backgroundColor: Color(0xffff7675),
                      elevation: 8,
                      onPressed: () {
                        setState(() {
                          angle = 0.5;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() async {
                            listElements.remove(listElements[0]);
                            if (listElements.isEmpty) {
                              await Future.delayed(Duration(seconds: 5), () {
                                showPopUpWaitOthers();
                              });
                              Get.to(ResultsScreen());
                            }
                            angle = .0;
                          });
                        });
                      },
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          Divider(
            height: 0,
          ),

          SizedBox(height: 8),
        ])));
  }
}
