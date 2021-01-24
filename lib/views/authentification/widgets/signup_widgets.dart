import 'package:email_validator/email_validator.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_long/controllers/authentification/singup_controller.dart';
import 'package:proj_long/views/authentification/login_screen.dart';
import 'package:proj_long/views/tools/dimensions.dart';

final SignUpController signUpController = Get.put(SignUpController());

Widget signupLayout() {
  return Form(
    key: signUpController.formKey,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getHeight(78)),
        Text(
          "Welcome back!",
          style: TextStyle(
            fontFamily: "Lora",
            fontSize: 32,
            color: Color(0xffeceded),
          ),
        ),
        SizedBox(height: getHeight(16)),
        firstNameInput(),
        SizedBox(height: getHeight(8)),
        lastNameInput(),
        SizedBox(height: getHeight(8)),
        emailInput(),
        SizedBox(height: getHeight(8)),
        passwordInput(),
        SizedBox(height: getHeight(16)),
        submitButton(),
        SizedBox(height: getHeight(8)),
        Center(
          child: Text(
            "Vous avez déjà un compte?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              color: Color(0xff707070),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.offAll(LoginScreen());
          },
          child: Center(
            child: Text(
              "Connectez-vous",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 16,
                color: Color(0xff5a69be),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

// Input textfields

Widget firstNameInput() {
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
        controller: signUpController.firstNameTextController, //
        onTap: () {
          signUpController.selectedField(1);
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
          prefixIcon: Icon(
            Icons.person,
            color: signUpController.selectedField.value == 1
                ? Color(0xff5a69be)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Nom",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 1
                ? Color(0xff5a69be)
                : Color(0xffcfcfcf),
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

Widget lastNameInput() {
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
        controller: signUpController.lastNameTextController, //
        onTap: () {
          signUpController.selectedField(1);
        },
        validator: (lastName) {
          Pattern pattern = r"^([a-zA-Z]+[\'\,\.\-]?[a-zA-Z ]*)+$";
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(lastName))
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
          prefixIcon: Icon(
            Icons.person,
            color: signUpController.selectedField.value == 2
                ? Color(0xff5a69be)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Nom",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 2
                ? Color(0xff5a69be)
                : Color(0xffcfcfcf),
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
    child: Align(
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        controller: signUpController.emailTextController,
        validator: (value) => EmailValidator.validate(value)
            ? null
            : "Veuillez introduire une adresse email correcte",
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        onTap: () {
          signUpController.selectedField(3);
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: Color(0xff5a69be),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email,
            color: signUpController.selectedField.value == 3
                ? Color(0xff5a69be)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 3
                ? Color(0xff5a69be)
                : Color(0xffcfcfcf),
          ),
          //Borders
          border: InputBorder.none,
          errorStyle: TextStyle(height: 0),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0),
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
        controller: signUpController.passwordTextController,
        validator: (password) {
          if (password.length < 6)
            return 'Le mot de passe doit contenir au moins 6 caractères';
          else
            return null;
        },
        style: TextStyle(
          fontFamily: "Montserrat",
          fontSize: 13,
          color: Color(0xff5a69be),
        ),
        onTap: () {
          signUpController.selectedField(4);
        },
        obscureText: true,
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          prefixIcon: Icon(
            Icons.lock,
            color: signUpController.selectedField.value == 4
                ? Color(0xff5a69be)
                : Color(0xff707070).withOpacity(0.5),
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 13,
            color: signUpController.selectedField.value == 4
                ? Color(0xff5a69be)
                : Color(0xffcfcfcf),
          ),
          //Borders
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
        ),
      ),
    ),
  );
}

Widget submitButton() {
  return InkWell(
    onTap: () {
      // Treat the gender case
    },
    child: Container(
      height: getHeight(50),
      width: SizeConfig.screenWidth - 24,
      decoration: BoxDecoration(
        color: Color(0xff37393B),
        borderRadius: BorderRadius.circular(40.00),
      ),
      child: Center(
        child: Text("Créer un compte",
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

void signupError() async {
  return Future.delayed(Duration(seconds: 2)).then((_) async {
    Get.back();
    Get.dialog(Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: SizeConfig.screenHeight * .6,
                  width: SizeConfig.screenWidth * .6,
                  child: FlareActor("assets/animations/wrong.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "Untitled"),
                ),
              ),
              Text(
                "Une erreur est survenue\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    color: Colors.black),
              ),
              Text(
                signUpController.errorMessage.value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 14,
                    color: Colors.black),
                softWrap: true,
              ),
            ],
          )),
        ),
      ),
    ));
  });
}

void signUpSuccess() async {
  return Future.delayed(Duration(seconds: 1)).then((_) async {
    Get.back();
    Get.dialog(Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.offAll(LoginScreen(), transition: Transition.rightToLeft);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: SizeConfig.screenHeight * .6,
                  width: SizeConfig.screenWidth * .6,
                  child: FlareActor("assets/animations/checkmark.flr",
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: "Untitled"),
                ),
              ),
              Text(
                "Inscription avec succès!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 18,
                    color: Colors.black),
              ),
              Text(
                "Veuillez vous connecter",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 15,
                    color: Colors.black),
                softWrap: true,
              ),
            ],
          )),
        ),
      ),
    ));
    Future.delayed(Duration(seconds: 3)).then((_) async {
      Get.offAll(LoginScreen(), transition: Transition.rightToLeft);
    });
  });
}
