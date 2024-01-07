import 'package:e_commerce_app/util/app-constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';

import 'sign-in-screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColors,
          centerTitle: true,
          title: Text(
            'Sign In',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('Welcome to my app',
                    style: TextStyle(
                    color: AppConstant.appScendoryColors,
                    fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        cursorColor: AppConstant.appScendoryColors,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.only(top: 2, left: 8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appScendoryColors,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'UserName',
                          prefixIcon: Icon(Icons.person),
                          contentPadding: EdgeInsets.only(top: 2, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appScendoryColors,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Phone',
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.only(top: 2, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appScendoryColors,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                          hintText: 'City',
                          prefixIcon: Icon(Icons.location_city),
                          contentPadding: EdgeInsets.only(top: 2, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: AppConstant.appScendoryColors,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.only(top: 2, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
            
                SizedBox(
                  height: Get.height / 20,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                        color: AppConstant.appScendoryColors,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: AppConstant.appScendoryColors),
                    ),
                    GestureDetector(
                      onTap: ()=> Get.offAll(()=> SignInScreen()),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: AppConstant.appScendoryColors,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
