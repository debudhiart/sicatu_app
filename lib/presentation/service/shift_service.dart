import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/shift.dart';

class ShiftService {
  final String url = 'http://192.168.106.1:8000/api/shift';

  Future<List<Shift>> getShiftService() async {
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return List<Shift>.from(data["data"].map((x) => Shift.fromJson(x)));
  }
}
