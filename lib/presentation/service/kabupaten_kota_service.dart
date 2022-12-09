import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';

import '../../common/token.dart';

class KabupatenKotaService {
  final String url = 'http://192.168.106.1:8000/api/kabupaten-kota';

  Future<List<KabupatenKota>> getKabupatenKotaService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<KabupatenKota>.from(
        data["data"].map((x) => KabupatenKota.fromJson(x)));
  }

  Future<KabupatenKota> getDetailKabupatenKotaService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    print(response);
    print(data);

    return KabupatenKota.fromJson(data['data']);
  }
}
