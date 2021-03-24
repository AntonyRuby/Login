import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../../../business_logic/models/login.dart';

class Email extends StatelessWidget {
  final Login login;
  final bool referral;

  const Email({
    Key key,
    @required this.emailController,
    @required this.login,
    this.referral = false,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.grey[400])),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400])),
            labelText: referral ? "Referral Code (Optional)" : "Email ID",
            floatingLabelBehavior: FloatingLabelBehavior.always),
        validator: (value) {
          return EmailValidator.validate(value) ? null : "Invalid email";
        },
        onChanged: (value) {
          if (referral) {
            login.referral = value;
          } else {
            login.email = value;
          }
        },
      ),
    );
  }
}
