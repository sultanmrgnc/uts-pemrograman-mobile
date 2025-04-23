import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  String? _username;
  bool _isLoggedIn = false;

  String? get username => _username;
  bool get isLoggedIn => _isLoggedIn;

  void login(String username, String password) {
    if (username.isNotEmpty && password.length >= 6) {
      _username = username;
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout() {
    _username = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
