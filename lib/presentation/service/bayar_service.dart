import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../common/token.dart';
import '../../data/datasources/models/bayar.dart';

class BayarService {
  final String url = 'http://192.168.106.1:8000/api/bayar';

  Future<List<Bayar>> getBayarService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<Bayar>.from(data["data"].map((x) => Bayar.fromJson(x)));
  }

  Future<Bayar> getDetailBayarService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return Bayar.fromJson(data['data']);
  }
}
