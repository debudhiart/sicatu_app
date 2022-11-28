import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';

class KabupatenKotaService {
  final String url = 'http://192.168.106.1:8000/api/kabupaten-kota';

  Future<List<KabupatenKota>> getKabupatenKotaService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<KabupatenKota>.from(
        data["data"].map((x) => KabupatenKota.fromJson(x)));
  }
}
