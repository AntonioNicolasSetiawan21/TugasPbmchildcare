import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isParent = false;

  void login(bool isParent) {
    isLoggedIn = true;
    this.isParent = isParent;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}