import 'dart:async';

import 'package:e_commerce_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce_app/screens/user_panel/main_screen.dart';
import 'package:e_commerce_app/util/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(()=>WelcomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColors,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColors,
        elevation: 0,
      ),
      body: Container(

        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: size.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(color: AppConstant.appTextColor,
                fontSize: 12,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
