import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //To animate the textfields
  var emailCheck = false.obs;
  var passCheck = false.obs;
  final formKey = GlobalKey<FormState>();

  // To save email and password
  TextEditingController loginEmailTextController;
  TextEditingController loginPasswordTextController;

  @override
  void onInit() {
    loginEmailTextController = TextEditingController();
    loginPasswordTextController = TextEditingController();
    super.onInit();
  }
}
