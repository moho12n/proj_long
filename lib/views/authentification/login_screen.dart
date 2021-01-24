import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proj_long/controllers/authentification/login_controller.dart';
import 'package:proj_long/views/authentification/signup_screen.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: GetX<LoginController>(builder: (loginController) {
              return loginLayout();
            }),
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return Container(
      //Email
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
          controller: loginController.loginEmailTextController,
          onTap: () {
            loginController.emailCheck(true);
            loginController.passCheck(false);
          },
          validator: (value) => EmailValidator.validate(value)
              ? null
              : "Veuillez introduire une adresse email correcte",
          keyboardType: TextInputType.emailAddress,
          cursorColor: Color(0xff5a69be),
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: Color(0xff5a69be),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: loginController.emailCheck.value == true
                  ? Color(0xff5a69be)
                  : Color(0xff707070).withOpacity(0.5),
            ),
            hintText: "Email",
            hintStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 13,
              color: loginController.emailCheck.value == true
                  ? Color(0xff5a69be)
                  : Color(0xffcfcfcf),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.00),
              borderSide: BorderSide(
                color: Color(0xff5a69be),
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.00),
              borderSide: BorderSide(color: Colors.transparent, width: 0.0),
            ),
            border: InputBorder.none,
            errorStyle: TextStyle(height: 0),
          ),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      //Password
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
          controller: loginController.loginPasswordTextController,
          obscureText: true,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: Color(0xff5a69be),
          ),
          onTap: () {
            loginController.emailCheck(false);
            loginController.passCheck(true);
          },
          validator: (password) {
            if (password.length < 6)
              return 'Veuillez entrez un mot de passe correcte';
            else
              return null;
          },
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: loginController.passCheck.value == true
                  ? Color(0xff5a69be)
                  : Color(0xff707070).withOpacity(0.5),
            ),
            hintText: "Mot de passe",
            hintStyle: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 13,
              color: loginController.passCheck.value == true
                  ? Color(0xff5a69be)
                  : Color(0xffcfcfcf),
            ),
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
            border: InputBorder.none,
            errorStyle: TextStyle(height: 0),
          ),
        ),
      ),
    );
  }

  Widget loginLayout() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(54),
            ),
            child: SvgPicture.asset("assets/back_button.svg"),
          ),
          Text(
            "Welcome back!",
            style: TextStyle(
              fontFamily: "Lora",
              fontSize: 32,
              color: Color(0xffeceded),
            ),
          ),
          SizedBox(height: getHeight(70)),
          Center(child: emailInput()),
          SizedBox(height: getHeight(16)),
          Center(child: passwordInput()),
          SizedBox(height: getHeight(8)),
          Padding(
            padding: EdgeInsets.only(right: getWidth(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Text("Mot de passe oublié ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 14,
                        color: Color(0xfffafafa),
                      )),
                )
              ],
            ),
          ),
          SizedBox(height: getHeight(16)),
          InkWell(
            onTap: () {
              //         Get.offAll(HomePage());
              if (_formKey.currentState.validate()) {}
            },
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
                child: Text("Se connecter",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xffeceded),
                    )),
              ),
            ),
          ),
          SizedBox(height: getHeight(8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Vous n'avez pas de compte?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: Color(0xff707070),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.offAll(SignupScreen(),
                      transition: Transition.rightToLeft);
                },
                child: Text(
                  "S'inscrire",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Color(0xff5a69be),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
