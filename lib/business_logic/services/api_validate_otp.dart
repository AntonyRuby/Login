import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../models/user.dart';
import '../models/login.dart';

Future validateOtp() async {
  user.result = "";
  user.status = "checking";

  http.Response response = await http.post(Uri.parse(api_url + "/validate-otp"),
      headers: {
        "token": user.token,
        "company": "784100",
        "Authorization": "Basic YWRtaW46YWRtaW4=",
        "entityType": "customer",
        "countryCode": "AE",
        "branch": "784999",
        "channel": "mobile",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
          {"agentcode": 784999, "mobileno": login.mobile, "otp": 1234}));

  print("Validate OTP: " + response.statusCode.toString());
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    user.result = data["data"];
    user.status = data["status"];
  }
}
