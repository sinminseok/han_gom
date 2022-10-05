
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User_Controller with ChangeNotifier {

  User? _user;

  User? get user => _user;

  void current_user(User login_user){
    _user = login_user;
    notifyListeners();
  }
}