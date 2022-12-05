import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/keluhan.dart';

class KeluhanService {
  final String url = 'http://192.168.106.1:8000/api/keluhan';

  Future<List<Keluhan>> getKeluhanService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<Keluhan>.from(data["data"].map((x) => Keluhan.fromJson(x)));
  }

  Future<Keluhan> getDetailKeluhanService(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));
    var data = json.decode(response.body);

    return Keluhan.fromJson(data['data']);
  }
}
