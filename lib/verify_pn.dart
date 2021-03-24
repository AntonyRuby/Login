import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatefulWidget {
  @override
  _VerifyState createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
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
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
              "+971 50 324 1324",
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          PinCodeTextField(
            appContext: context,
            onChanged: (String value) {},
            length: 5,
            obscureText: true,
            animationType: AnimationType.fade,
            animationDuration: Duration(milliseconds: 300),
            // backgroundColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              borderRadius: BorderRadius.circular(5),
              inactiveColor: Colors.black,
              selectedColor: Colors.blue,
              fieldHeight: 50,
              fieldWidth: 40,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Expires in 04:20",
                style: TextStyle(fontSize: 16.0),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "Auto Fill",
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                height: 45,
                minWidth: 400,
                child: Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Didn't receive the verification code?",
                style: TextStyle(fontSize: 16.0),
              ),
              InkWell(
                  onTap: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),
                  ))
            ],
          ),
        ]));
  }
}
