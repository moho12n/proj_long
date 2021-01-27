import 'package:flutter/material.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';

class CreateRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ThemeColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: getHeight(72)),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 20),
                      Text(
                        "Créer un salon",
                        style: TextStyle(
                          fontFamily: "Lora",
                          fontSize: 24,
                          color: Color(0xffeceded),
                        ),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: getHeight(70),
            ),
            Center(child: roomNameInput()),
            SizedBox(
              height: getHeight(20),
            ),
            Center(child: dateInput()),
            SizedBox(
              height: getHeight(20),
            ),
            Center(child: timeInput()),
            SizedBox(
              height: getHeight(20),
            ),
            Center(child: categoryInput()),
            SizedBox(
              height: getHeight(20),
            ),
            Center(child: button()),
            SizedBox(
              height: getHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}

Widget roomNameInput() {
  return Container(
    //Full name
    height: getHeight(50),
    width: SizeConfig.screenWidth - 24,
    decoration: BoxDecoration(
      color: Color(0xff262729),
      border: Border.all(
        width: 2.00,
        color: Color(0xff37393b),
      ),
      borderRadius: BorderRadius.circular(40.00),
    ),
    child: Center(
      child: TextFormField(
        //controller: signUpController.firstNameTextController, //
        onTap: () {
          //signUpController.selectedField(1);
        },
        validator: (firstName) {
          Pattern pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(firstName))
            return 'Veuillez introduire un nom et un prénom correcte';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xff5a69be),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          // prefixIcon: Icon(
          //   Icons.room,
          //   color:
          //       true ? Color(0xff5a69be) : Color(0xff707070).withOpacity(0.5),
          // ),
          hintText: "Nom de salon",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: false ? Color(0xff5a69be) : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xff5a69be),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget dateInput() {
  return Container(
    //Full name
    height: getHeight(50),
    width: SizeConfig.screenWidth - 24,
    decoration: BoxDecoration(
      color: Color(0xff262729),
      border: Border.all(
        width: 2.00,
        color: Color(0xff37393b),
      ),
      borderRadius: BorderRadius.circular(40.00),
    ),
    child: Center(
      child: TextFormField(
        //controller: signUpController.firstNameTextController, //
        onTap: () {
          //signUpController.selectedField(1);
        },
        validator: (firstName) {
          Pattern pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(firstName))
            return 'Veuillez introduire un nom et un prénom correcte';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xff5a69be),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          // prefixIcon: Icon(
          //   Icons.room,
          //   color:
          //       true ? Color(0xff5a69be) : Color(0xff707070).withOpacity(0.5),
          // ),
          hintText: "27/01/2021",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: false ? Color(0xff5a69be) : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xff5a69be),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget timeInput() {
  return Container(
    //Full name
    height: getHeight(50),
    width: SizeConfig.screenWidth - 24,
    decoration: BoxDecoration(
      color: Color(0xff262729),
      border: Border.all(
        width: 2.00,
        color: Color(0xff37393b),
      ),
      borderRadius: BorderRadius.circular(40.00),
    ),
    child: Center(
      child: TextFormField(
        //controller: signUpController.firstNameTextController, //
        onTap: () {
          //signUpController.selectedField(1);
        },
        validator: (firstName) {
          Pattern pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(firstName))
            return 'Veuillez introduire un nom et un prénom correcte';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xff5a69be),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          // prefixIcon: Icon(
          //   Icons.room,
          //   color:
          //       true ? Color(0xff5a69be) : Color(0xff707070).withOpacity(0.5),
          // ),
          hintText: "13:00",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: false ? Color(0xff5a69be) : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xff5a69be),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget categoryInput() {
  return Container(
    //Full name
    height: getHeight(50),
    width: SizeConfig.screenWidth - 24,
    decoration: BoxDecoration(
      color: Color(0xff262729),
      border: Border.all(
        width: 2.00,
        color: Color(0xff37393b),
      ),
      borderRadius: BorderRadius.circular(40.00),
    ),
    child: Center(
      child: TextFormField(
        //controller: signUpController.firstNameTextController, //
        onTap: () {
          //signUpController.selectedField(1);
        },
        validator: (firstName) {
          Pattern pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(firstName))
            return 'Veuillez introduire un nom et un prénom correcte';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        keyboardType: TextInputType.name,
        cursorColor: Color(0xff5a69be),
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          // prefixIcon: Icon(
          //   Icons.room,
          //   color:
          //       true ? Color(0xff5a69be) : Color(0xff707070).withOpacity(0.5),
          // ),
          suffixIcon: Icon(Icons.arrow_drop_down,
              size: 36, color: Color(0xff707070).withOpacity(0.5)),
          hintText: "Type de salon",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: false ? Color(0xff5a69be) : Color(0xffcfcfcf),
          ),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29.00),
            borderSide: BorderSide(
              color: Color(0xff5a69be),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
      ),
    ),
  );
}

Widget button() {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.all(Radius.circular(40)),
    highlightColor: Colors.transparent,
    child: Container(
      height: getHeight(50),
      width: SizeConfig.screenWidth - 24,
      decoration: BoxDecoration(
        color: Color(0xff37393B),
        borderRadius: BorderRadius.circular(40.00),
      ),
      child: Center(
        child: Text("Créer salon",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xffeceded),
            )),
      ),
    ),
  );
}
