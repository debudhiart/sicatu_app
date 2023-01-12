import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/token.dart';
import '../../data/datasources/models/desa.dart';

class DesaService {
  final String url = 'http://192.168.106.1:8000/api/desa';

  Future<List<Desa>> getDesaService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<Desa>.from(data["data"].map((x) => Desa.fromJson(x)));
  }

  Future<Desa> getDetailDesaService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return Desa.fromJson(data['data']);
  }

  Future saveNewDesa(
    int kecamatan_id,
    String nama_desa,
  ) async {
    final response = await http.post(
        Uri.parse(
          '$url/store',
        ),
        headers: setHeaders(),
        body: jsonEncode({
          "kecamatan_id": kecamatan_id,
          "nama_desa": nama_desa,
        }));

    print(response);
    return json.decode(response.body);
  }

  Future editDataDesa(int desa_id, int kecamatan_id, String nama_desa) async {
    final response = await http.post(
        Uri.parse(
          '$url/update/$desa_id',
        ),
        headers: setHeaders(),
        body: jsonEncode({
          // "roles_id": roles_id,
          "kecamatan_id": kecamatan_id,
          "nama_desa": nama_desa,
        }));

    print(response);
    return json.decode(response.body);
  }

  Future<void> deleteDataDesaService(int id) async {
    await getToken();
    var response = await http.post(
      Uri.parse('$url/delete/$id'),
      headers: setHeaders(),
    );

    var data = json.decode(response.body);

    // return data["message"]);
  }
}
