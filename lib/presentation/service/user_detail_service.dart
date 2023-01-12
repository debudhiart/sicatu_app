import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

import '../../common/token.dart';
import '../../data/datasources/models/user.dart';

class UserDetailService {
  final String url = 'http://192.168.106.1:8000/api/user';

  Future<UserDetail> getDetailUserService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );

    var data = json.decode(response.body);

    return UserDetail.fromJson(data["data"]);
  }

  Future editDataUser(int id, int desa_id, String nama, String email,
      String address, String hp) async {
    final response = await http.post(
        Uri.parse(
          '$url/edit/$id',
        ),
        headers: setHeaders(),
        body: jsonEncode({
          // "roles_id": roles_id,
          "desa_id": desa_id,
          "nama": nama,
          "email": email,
          "hp": hp,
          "address": address,
        }));

    print(response);
    return json.decode(response.body);
  }

  Future<void> deleteDataUserService(int id) async {
    await getToken();
    var response = await http.post(
      Uri.parse('$url/delete/$id'),
      headers: setHeaders(),
    );

    var data = json.decode(response.body);

    // return data["message"]);
  }
}
