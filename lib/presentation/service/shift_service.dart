import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/shift.dart';

import '../../common/token.dart';

class ShiftService {
  final String url = 'http://192.168.106.1:8000/api/shift';

  Future<List<Shift>> getShiftService() async {
    await getToken();
    var response = await http.get(
      Uri.parse(url),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return List<Shift>.from(data["data"].map((x) => Shift.fromJson(x)));
  }

  Future<Shift> getDetailShiftService(int id) async {
    await getToken();
    var response = await http.get(
      Uri.parse('$url/$id'),
      headers: setHeaders(),
    );
    var data = json.decode(response.body);

    return Shift.fromJson(data['data']);
  }
}
