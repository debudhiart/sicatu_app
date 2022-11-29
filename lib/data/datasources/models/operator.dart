import 'dart:ffi';

import 'package:sicatu_app/data/datasources/models/Jabatan.dart';
import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/jenis_langganan.dart';
// import 'package:sicatu_app/data/datasources/models/Role.dart';
import 'package:sicatu_app/data/datasources/models/user.dart';

class Operator {
  Operator({
    required this.operator_id,
    this.desa_id,
    this.users_id,
    this.jabatan_id,
    required this.nama_operator,
    required this.alamat,
    this.hp,
    required this.created_at,
    required this.updated_at,
    this.users,
    this.desa,
    this.jabatan,
  });
  int operator_id;
  int? desa_id;
  int? users_id;
  int? jabatan_id;
  String nama_operator;
  String alamat;
  String? hp;
  String created_at;
  String updated_at;
  User? users;
  Desa? desa;
  Jabatan? jabatan;

  factory Operator.fromJson(Map<String, dynamic> json) => Operator(
        operator_id: json["operator_id"],
        users_id: json["users_id"],
        desa_id: json["desa_id"],
        jabatan_id: json["jabatan_id"],
        nama_operator: json["nama_operator"],
        alamat: json["alamat"],
        hp: json["hp"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        users: json["user"] != null ? User.fromJson(json["user"]) : null,
        jabatan:
            json["jabatan"] != null ? Jabatan.fromJson(json["jabatan"]) : null,
      );
}
