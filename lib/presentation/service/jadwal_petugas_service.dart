import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/jadwal_petugas.dart';

class JadwalPetugasService {
  final String url = 'http://192.168.106.1:8000/api/jadwal-petugas';

  Future<List<JadwalPetugas>> getJadwalPetugasService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<JadwalPetugas>.from(
        data["data"].map((x) => JadwalPetugas.fromJson(x)));
  }

  Future<JadwalPetugas> getDetailJadwalPetugasService(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));
    var data = json.decode(response.body);

    return JadwalPetugas.fromJson(data['data']);
  }
}
