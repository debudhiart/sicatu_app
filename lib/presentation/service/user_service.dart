import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/models/User.dart';

class UserService {
  final String url = 'http://192.168.106.1:8000/api/user';

  Future<List<User>> getUserService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<User>.from(data["data"].map((x) => User.fromJson(x)));
  }
}
