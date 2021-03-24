import 'package:flutter/cupertino.dart';

Login login = Login();

class Login extends ChangeNotifier {
  String email;
  String prefix = "+971";
  String mobile = "123 456 7890";
  bool hasReferral = false;
  String referral;

  void setHasReferral(value) {
    this.hasReferral = value;
    notifyListeners();
  }
}
