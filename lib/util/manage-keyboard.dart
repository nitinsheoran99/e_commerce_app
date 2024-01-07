import 'package:flutter/cupertino.dart';

class KeyboradUtil{
  static void hideKeyborad(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}
