

import '../e_commerce.dart';

Future<String> getCustomerDeviceToken() async {
  try {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      return token;
    } else {
      throw Exception("Error");
    }
  } catch (e) {
    if (kDebugMode) {
      print("Error $e");
    }
    throw Exception("Error");
  }
}