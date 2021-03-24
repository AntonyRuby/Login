import 'package:flutter/material.dart';
import 'package:login/screens/login/components/email.dart';
import 'package:provider/provider.dart';
import '../../../business_logic/models/login.dart';

class Referral extends StatefulWidget {
  final Login login;
  Referral({@required this.login});

  @override
  _ReferralState createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        Login();
      },
      child: Container(child: () {
        if (widget.login.hasReferral) {
          return ReferralCode(login: widget.login);
        } else {
          return GotReferral(
            login: widget.login,
            refresh: refresh,
          );
        }
      }()),
    );
  }
}

class ReferralCode extends StatefulWidget {
  final Login login;
  ReferralCode({@required this.login});

  @override
  _ReferralCodeState createState() => _ReferralCodeState();
}

class _ReferralCodeState extends State<ReferralCode> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new Email(
      emailController: emailController,
      login: widget.login,
      referral: true,
    ));
  }
}

class GotReferral extends StatelessWidget {
  final Login login;
  final refresh;
  GotReferral({@required this.login, @required this.refresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),
            child: Text("Got a referral code?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Switch(
                value: login.hasReferral,
                onChanged: (value) {
                  login.setHasReferral(value);
                  refresh();
                }),
          ),
        ],
      ),
    );
  }
}
