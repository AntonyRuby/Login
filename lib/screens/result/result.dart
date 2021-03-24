import 'package:flutter/material.dart';
import '../../business_logic/models/user.dart';
import '../../constants.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Text(
            "OTP Generated: ${user.generatedOtp}",
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            "OTP Entered: ${user.otp}",
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            "Validation API result: ${user.result}",
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(
            height: size.height * 0.1,
          )
        ],
      ),
    ));
  }
}
