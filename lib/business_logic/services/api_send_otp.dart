import 'dart:convert';

import 'package:http/http.dart' as http;
import "../../constants.dart";
import '../models/user.dart';
import '../models/login.dart';
import 'api_login.dart';

Future sendOtp() async {
  await getToken();

  http.Response response = await http.post(Uri.parse(api_url + "/send-otp"),
      headers: {
        "token": user.token,
        "company": "784100",
        "Authorization": "Basic YWRtaW46YWRtaW4=",
        "entityType": "admin",
        "countryCode": "AE",
        "branch": "784999",
        "channel": "mobile",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "agentcode": 784999,
        "mobileno": login.mobile,
      }));

  print("Get OTP: " + response.statusCode.toString());
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    user.generatedOtp = data["data"]["otp"];
  }
}
