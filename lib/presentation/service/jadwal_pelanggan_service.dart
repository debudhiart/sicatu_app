import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/jadwal_pelanggan.dart';

class JadwalPelangganService {
  final String url = 'http://192.168.106.1:8000/api/jadwal-pelanggan';

  Future<List<JadwalPelanggan>> getJadwalPelangganService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<JadwalPelanggan>.from(
        data["data"].map((x) => JadwalPelanggan.fromJson(x)));
  }
}
