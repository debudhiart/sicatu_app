import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

var token;

getToken() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  token = jsonDecode(localStorage.getString('token') ?? '')['token'];
}

setHeaders() => {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
