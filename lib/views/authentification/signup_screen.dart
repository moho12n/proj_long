import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_long/controllers/authentification/singup_controller.dart';
import 'package:proj_long/views/authentification/widgets/signup_widgets.dart';
import 'package:proj_long/views/tools/colors.dart';
import 'package:proj_long/views/tools/dimensions.dart';

class SignupScreen extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColors.backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: GetX<SignUpController>(builder: (signUpController) {
              return signupLayout();
            }),
          ),
        ),
      ),
    );
  }
}
