import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/token.dart';
import '../../data/datasources/models/jenis_langganan.dart';

class JenisLanggananService {
  final String url = 'http://192.168.106.1:8000/api/jenis-langganan';

  Future<List<JenisLangganan>> getJenisLanggananService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<JenisLangganan>.from(
        data["data"].map((x) => JenisLangganan.fromJson(x)));
  }

  Future<JenisLangganan> getDetailJenisLanggananService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return JenisLangganan.fromJson(data['data']);
  }
}
