import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/token.dart';
import '../../data/datasources/models/keluhan.dart';

class KeluhanService {
  final String url = 'http://192.168.106.1:8000/api/keluhan';

  Future<List<Keluhan>> getKeluhanService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<Keluhan>.from(data["data"].map((x) => Keluhan.fromJson(x)));
  }

  Future<Keluhan> getDetailKeluhanService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return Keluhan.fromJson(data['data']);
  }
}
