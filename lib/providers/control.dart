import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool _check = false;
  bool get check{
    return _check;
  }
  void setControl() {
    if (_check == false)
      _check = true;
    else
      _check = false;
       notifyListeners();
  }
}
