import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/provinsi.dart';

class ProvinsiService {
  final String url = 'http://192.168.106.1:8000/api/provinsi';
  // final String url1 = 'http://192.168.106.1:8000/api/provinsi/1';

  Future<List<Provinsi>> getProvinsiService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    print(response);
    print(data);

    return List<Provinsi>.from(data["data"].map((x) => Provinsi.fromJson(x)));
  }

  Future<Provinsi> getDetailProvinsiService(int id) async {
    var response = await http.get(Uri.parse('$url/$id'));
    var data = json.decode(response.body);

    print(response);
    print(data);

    return Provinsi.fromJson(data['data']);
  }
}
