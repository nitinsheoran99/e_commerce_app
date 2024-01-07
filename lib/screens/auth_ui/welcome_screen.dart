import 'package:e_commerce_app/controller/googel-sign-in-controller.dart';
import 'package:e_commerce_app/screens/auth_ui/sign-in-screen.dart';
import 'package:e_commerce_app/util/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
   WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController= Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appScendoryColors,
        title: Text(
          'Welcome to my app',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Happy Shopping',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: Get.height / 12,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScendoryColors,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                  onPressed: () {
                    _googleSignInController.signInWithGoogle();
                  },
                  label: Text(
                    "Sign in with google",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  icon: Image.asset(
                    'assets/images/google.png',
                    width: Get.width / 12,
                    height: Get.height / 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 30,
            ),
            Material(
              child: Container(
                width: Get.width / 1.2,
                height: Get.height / 12,
                decoration: BoxDecoration(
                    color: AppConstant.appScendoryColors,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton.icon(
                  onPressed: () {
                    Get.to(()=>SignInScreen());
                  },
                  label: Text(
                    "Sign in with email",
                    style: TextStyle(color: AppConstant.appTextColor),
                  ),
                  icon: Icon(Icons.email_outlined,color: AppConstant.appTextColor,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
