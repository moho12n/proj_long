import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var selectedField = 0.obs;

  var errorMessage = "".obs; // signup error message

  //To control the form
  final formKey = GlobalKey<FormState>();
  // To save email and password
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  TextEditingController firstNameTextController;
  TextEditingController lastNameTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    firstNameTextController = TextEditingController();
    lastNameTextController = TextEditingController();
    super.onInit();
  }
}
