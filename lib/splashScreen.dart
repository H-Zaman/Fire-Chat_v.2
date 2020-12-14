import 'package:firechat/authentication/view/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: ()=> Get.offAll(LoginScreen()),
          child: FlutterLogo(
            size: 300,
          ),
        ),
      ),
    );
  }
}
