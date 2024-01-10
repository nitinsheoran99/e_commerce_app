import 'package:e_commerce_app/controller/sign-in-controller.dart';
import 'package:e_commerce_app/screens/auth_ui/sign-up-screen.dart';
import 'package:e_commerce_app/screens/user_panel/main_screen.dart';
import 'package:e_commerce_app/util/app-constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controller/get-user-data-controller.dart';
import '../admin_panel/admin-main-screen.dart';
import 'forgot-password-screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
  Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendoryColors,
          centerTitle: true,
          title: const Text(
            'Sign In',
            style: TextStyle(color: AppConstant.appTextColor),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isKeyboardVisible
                  ? const Text('Welcome to my app')
                  : Column(
                      children: [
                        Lottie.asset('assets/images/splash-icon.json'),
                      ],
                    ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.appScendoryColors,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        contentPadding: const EdgeInsets.only(top: 2, left: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,
                      obscureText: signInController.isPasswordVisible.value,
                      cursorColor: AppConstant.appScendoryColors,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          contentPadding: const EdgeInsets.only(top: 2, left: 8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Get.to(() => const ForgetPasswordScreen());
                  },
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                        color: AppConstant.appScendoryColors,
                        fontWeight: FontWeight.bold),
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
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appScendoryColors,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        UserCredential? userCredential = await signInController
                            .signInMethod(email, password);
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if (userData[0]['isAdmin'] == true) {
                              Get.snackbar(
                                "Success Admin Login",
                                "login Successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColors,
                                colorText: AppConstant.appTextColor,
                              );
                              Get.offAll(() => const AdminMainScreen());
                            } else {
                              Get.offAll(() => const MainScreen());
                              Get.snackbar(
                                "Success User Login",
                                "login Successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendoryColors,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please verify your email before login",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendoryColors,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendoryColors,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }
                    },

                    child: const Text(
                      "SIGN IN",
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
                  const Text(
                    "Dont't have an account",
                    style: TextStyle(color: AppConstant.appScendoryColors),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const SignUpScreen()),
                    child: const Text(
                      "Sign Up",
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
      );
    });
  }
}
