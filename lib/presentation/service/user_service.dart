import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

import '../../common/token.dart';
import '../../data/datasources/models/user.dart';

class UserService {
  final String url = 'http://192.168.106.1:8000/api';

  Future<List<User>> getUserService() async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/user'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<User>.from(data["data"].map((x) => User.fromJson(x)));
  }

  // Future<UserDetail> getDetailUserService(int id) async {
  //   await getToken();
  //   var response = await http.get(
  //     Uri.parse('$url/$id'),
  //     headers: setHeaders(),
  //   );
  //   var data = json.decode(response.body);

  //   return UserDetail.fromJson(data["data"]);
  // }

  Future saveNewUser(int roles_id, int desa_id, String nama, String email,
      String password, String address, String password_confirmed) async {
    final response = await http.post(
        Uri.parse(
          '$url/register',
        ),
        headers: setHeaders(),
        body: jsonEncode({
          "roles_id": roles_id,
          "desa_id": desa_id,
          "nama": nama,
          "email": email,
          "password": password,
          "password_confirmed": password_confirmed,
          "address": address,
        }));

    print(response);
    return json.decode(response.body);
  }

  Future<void> deleteDataUserService(int id) async {
    await getToken();
    var response = await http.post(
      Uri.parse('$url/user/delete/$id'),
      headers: setHeaders(),
    );

    var data = json.decode(response.body);

    // return data["message"]);
  }
}
