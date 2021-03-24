import 'package:flutter/material.dart';
import 'package:login/screens/verify_mobile/verify_mobile_screen.dart';
import 'components/mobile_number.dart';
import 'components/email.dart';
import 'components/referral.dart';
import '../../business_logic/models/login.dart';
import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool code = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = new TextEditingController();
  String phoneNumber = "";

  TextEditingController emailController = new TextEditingController();
  String emailID = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: IconButton(
                  icon: Icon(Icons.keyboard_backspace), onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Create Lulu Money account",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Email(emailController: emailController, login: login),
            SizedBox(
              height: 10.0,
            ),
            MobileNumber(phoneController: phoneController, login: login),
            SizedBox(
              height: 10.0,
            ),
            Referral(login: login),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Verify()));
                    }
                  },
                  color: Colors.lightBlue,
                  height: 50,
                  minWidth: 400,
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
