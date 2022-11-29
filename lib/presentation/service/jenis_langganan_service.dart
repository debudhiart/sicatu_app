import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/jenis_langganan.dart';

class JenisLanggananService {
  final String url = 'http://192.168.106.1:8000/api/jenis-langganan';

  Future<List<JenisLangganan>> getJenisLanggananService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<JenisLangganan>.from(
        data["data"].map((x) => JenisLangganan.fromJson(x)));
  }
}
