import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/Provinsi.dart';

class ProvinsiService {
  final String url = 'http://192.168.106.1:8000/api/provinsi';

  Future<List<Provinsi>> getProvinsiService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<Provinsi>.from(data["data"].map((x) => Provinsi.fromJson(x)));
  }
}
