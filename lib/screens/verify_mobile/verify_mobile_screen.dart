import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/business_logic/models/user.dart';
import 'package:login/business_logic/services/api_send_otp.dart';
import 'package:login/business_logic/services/api_validate_otp.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:login/business_logic/models/login.dart';
import '../result/result.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sendOtp(),
      builder: (context, snapshot) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: IconButton(
                    icon: Icon(Icons.keyboard_backspace),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Verify mobile number",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 0, 8),
                child: Text(
                  "Enter the 5 digit code we just sent to",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                child: Text(
                  "${login.prefix} ${login.mobile}",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32),
                child: PinCodeTextField(
                  appContext: context,
                  onChanged: (String value) {
                    user.otp = value;
                  },
                  length: 5,
                  obscureText: true,
                  animationType: AnimationType.scale,
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.grey[100],
                  keyboardType: TextInputType.number,
                  enablePinAutofill: true,
                  obscuringCharacter: '*',
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    borderRadius: BorderRadius.circular(5),
                    inactiveColor: Colors.black,
                    selectedColor: Colors.blue,
                    activeColor: Colors.lightBlue,
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Expires in ",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  TweenAnimationBuilder(
                      tween: Tween(begin: 300.0, end: 0),
                      duration: Duration(minutes: 5, seconds: 0),
                      builder: (context, value, child) {
                        int min = (value / 60.0).floor();
                        int sec = (value - (min * 60)).floor();
                        final formatter = new NumberFormat("00");
                        return Text(
                            "${formatter.format(min)}:${formatter.format(sec)}");
                      }),
                  Spacer(),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Auto Fill",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      )),
                  Spacer(),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: MaterialButton(
                    onPressed: () async {
                      await validateOtp();
                      if (user.status == "success") {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Result()));
                      }
                    },
                    color: Colors.lightBlue,
                    height: 50,
                    minWidth: 400,
                    child: Text(
                      "Verify",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Didn't receive the verification code?",
                      style: TextStyle(fontSize: 16.0),
                    ),
                    InkWell(
                        onTap: () {
                          sendOtp();
                          setState(() {
                            user.otp = "00000";
                          });
                        },
                        child: Text(
                          "Resend Code",
                          style: TextStyle(
                              color: Colors.lightBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ))
                  ],
                ),
              ),
            ]));
      },
    );
  }
}
