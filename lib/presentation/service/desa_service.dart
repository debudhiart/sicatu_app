import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/desa.dart';

class DesaService {
  final String url = 'http://192.168.106.1:8000/api/desa';

  Future<List<Desa>> getDesaService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<Desa>.from(data["data"].map((x) => Desa.fromJson(x)));
  }
}
