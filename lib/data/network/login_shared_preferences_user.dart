import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/controller/desa_controller.dart';

class LoginSharedPreferences {
  int users_id = 0;
  int roles_id = 0;
  int desa_id = 0;

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');
  }
}
