import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/token.dart';
import '../../data/datasources/models/jadwal_petugas.dart';

class JadwalPetugasService {
  final String url = 'http://192.168.106.1:8000/api/jadwal-petugas';

  Future<List<JadwalPetugas>> getJadwalPetugasService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<JadwalPetugas>.from(
        data["data"].map((x) => JadwalPetugas.fromJson(x)));
  }

  Future<JadwalPetugas> getDetailJadwalPetugasService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return JadwalPetugas.fromJson(data['data']);
  }
}
