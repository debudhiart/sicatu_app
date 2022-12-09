import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

import '../../common/token.dart';
import '../../data/datasources/models/user.dart';

class UserDetailService {
  final String url = 'http://192.168.106.1:8000/api/user';

  Future<UserDetail> getDetailUserService(int id) async {
    // try {
    //   // final uri = Uri.parse('http://ip-api.com/json/$ipAddress');
    //   // final response = await http.get(uri);

    //   var response = await http.get(
    //     Uri.parse('$url/$id'),
    //     headers: setHeaders(),
    //   );

    //   switch (response.statusCode) {
    //     case 200:
    //       var data = json.decode(response.body);
    //       return UserDetail.fromJson(data["data"]);
    //     default:
    //       throw Exception(response.reasonPhrase);
    //   }
    // } on SocketException catch (_) {
    //   // make it explicit that a SocketException will be thrown if the network connection fails
    //   rethrow;
    // }
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );

    var data = json.decode(response.body);

    return UserDetail.fromJson(data["data"]);
  }
}
