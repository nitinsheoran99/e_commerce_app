import 'package:e_commerce_app/util/app-constant.dart';
import 'package:flutter/material.dart';

class UserContactScreen extends StatefulWidget {
  const UserContactScreen({super.key});

  @override
  State<UserContactScreen> createState() => _UserContactScreenState();
}

class _UserContactScreenState extends State<UserContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColors,
        title: const Text('Contact Information',style: TextStyle(color: AppConstant.appTextColor),),
      ),
    );
  }
}
