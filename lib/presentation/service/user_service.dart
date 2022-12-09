import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

import '../../common/token.dart';
import '../../data/datasources/models/user.dart';

class UserService {
  final String url = 'http://192.168.106.1:8000/api/user';

  Future<List<User>> getUserService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
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
}
