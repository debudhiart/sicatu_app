import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../data/datasources/models/jabatan.dart';

class JabatanService {
  final String url = 'http://192.168.106.1:8000/api/jabatan';

  Future<List<Jabatan>> getJabatanService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<Jabatan>.from(data["data"].map((x) => Jabatan.fromJson(x)));
  }

  // Future<Jabatan> getDetailJabatanService(int id) async {
  //   var response = await http.get(Uri.parse('$url/$id'));
  //   var data = json.decode(response.body);

  //   return Jabatan.fromJson(data['data']);
  // }

  Future<Jabatan> getDetailJabatanService(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));
    var data = json.decode(response.body);
    print(data);

    return Jabatan.fromJson(data['data']);
  }
}
