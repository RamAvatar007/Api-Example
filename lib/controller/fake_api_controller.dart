import 'package:flutter/cupertino.dart';

class FakeApiController extends ChangeNotifier{
  bool isSwitch = false;

  void toggleSwitch(){
    isSwitch =!isSwitch;
    print("><><><><><>><><><><><><><$isSwitch");
    notifyListeners();
  }
}