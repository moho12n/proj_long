import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'main.dart';

///
class MatchCard extends StatefulWidget {
  final double width;
  final double aspectRatio;
  final Widget child;
  final int index;
  final double angle;
  final Function onPressed;

  const MatchCard({
    Key key,
    this.width = 200,
    this.aspectRatio = 3 / 4,
    this.child,
    this.index,
    this.angle,
    this.onPressed,
  }) : super(key: key);

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  double scale;
  double translate;
  double opacity;
  int factor;

  @override
  void initState() {
    factor = widget.index;
    translate = 0.0;
    opacity = 0.0;
    scale = (1.0 - 0.3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: AnimatedOpacity(
        opacity: (widget.index <= 3) ? (1.0 - 0.3 * widget.index) : 0.0,
        duration: (widget.index == 0)
            ? Duration(milliseconds: 0)
            : Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic,
          transform: Matrix4.identity()
            ..rotateZ((widget.angle == 0) ? 0 : pi / widget.angle)
            ..translate(
              (widget.index < 3)
                  ? (widget.width * 0.1 * widget.index) / 2 + widget.angle * 80
                  : (widget.width * 0.3) / 2,
              (widget.index < 3)
                  ? (widget.width * widget.aspectRatio * 0.1 * widget.index) +
                      (widget.index.toDouble() * 8) +
                      widget.angle * 80
                  : (widget.width * widget.aspectRatio * 0.1 * widget.index) +
                      24,
            )
            ..scale(
                (widget.index < 3) ? (1.0 - 0.1 * widget.index) : (1.0 - 0.3)),
          width: widget.width,
          height: widget.width * widget.aspectRatio,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  ThemeColors.backgroundColor,
                  ThemeColors.backgroundColorSoftLight,
                ]),
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.backgroundColor,
                  blurRadius: 16,
                  spreadRadius: -4,
                  offset: Offset(0, 8))
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final String imageLink;
  final String logoLink;
  final String price;
  final String distance;
  final String name;
  const CardContainer(
      {Key key,
      this.imageLink,
      this.logoLink,
      this.distance,
      this.price,
      this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth, image: NetworkImage(imageLink)),
                    ),
                  ),
                  logoLink != null
                      ? Container(
                          height: 60,
                          width: 60,
                          child: Image.network(
                              //'https://static.takeaway.com/images/restaurants/fr/R00Q15R1/logo_465x320.png'
                              logoLink),
                        )
                      : Container(),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffeceded),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.location_pin,
                          size: 16, color: Colors.white.withOpacity(0.8)),
                      Text(
                        "à " + distance + " kilomètre",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontSize: 12,
                          color: Color(0xffeceded),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Text(
                        "à partir de ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Color(0xffeceded),
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xffeceded),
                        ),
                      ),
                      Text(
                        "€",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xffeceded),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
