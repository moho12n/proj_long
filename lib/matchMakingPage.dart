import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'main.dart';
import 'matchCard.dart';

class MatchMakingPage extends StatefulWidget {
  @override
  _MatchMakingPageState createState() => _MatchMakingPageState();
}

class _MatchMakingPageState extends State<MatchMakingPage> {
  List<Widget> _cardList = [];
  double angle = 0.0;
  var listElements = ["", "", "", "", "", "", "", "", "", ""];
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
                          child: CardContainer(),
                        ));
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
                      backgroundColor: Color(0xffff7675),
                      elevation: 8,
                      onPressed: () {
                        setState(() {
                          angle = -4.0;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            listElements.remove(listElements[0]);
                            angle = 0.0;
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
                            Icon(Icons.favorite, size: 28, color: Colors.white),
                      ),
                      backgroundColor: Color(0xffff7675),
                      elevation: 8,
                      onPressed: () {
                        setState(() {
                          angle = 8.0;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          setState(() {
                            listElements.remove(listElements[0]);
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
