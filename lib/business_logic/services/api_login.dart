import 'dart:convert';

import 'package:http/http.dart' as http;
import "../../constants.dart";
import '../models/user.dart';

Future getToken() async {
  http.Response response = await http.post(Uri.parse(api_url + "/login"),
      headers: {
        "entityType": "customer",
        "countryCode": "AE",
        "branch": "784999",
        "channel": "mobile",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "customerno": user.customerNumber,
        "password": user.password,
      }));

  print("Login: " + response.statusCode.toString());
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    user.token = data["token"];
    user.loggedIn = true;
  }
}
