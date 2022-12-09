import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';

import '../../common/token.dart';

class KecamatanService {
  final String url = 'http://192.168.106.1:8000/api/kecamatan';

  Future<List<Kecamatan>> getKecamatanService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<Kecamatan>.from(data["data"].map((x) => Kecamatan.fromJson(x)));
  }

  Future<Kecamatan> getDetailKecamatanService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    print(response);
    print(data);

    return Kecamatan.fromJson(data['data']);
  }
}
