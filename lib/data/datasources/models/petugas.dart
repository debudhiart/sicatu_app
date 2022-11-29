import 'dart:ffi';

import 'package:sicatu_app/data/datasources/models/Jabatan.dart';
import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/jenis_langganan.dart';
// import 'package:sicatu_app/data/datasources/models/Role.dart';
import 'package:sicatu_app/data/datasources/models/user.dart';

class Petugas {
  Petugas({
    required this.petugas_id,
    this.desa_id,
    this.users_id,
    required this.nama_petugas,
    required this.alamat,
    this.hp,
    required this.created_at,
    required this.updated_at,
    this.users,
    this.desa,
  });
  int petugas_id;
  int? desa_id;
  int? users_id;

  String nama_petugas;
  String alamat;
  String? hp;
  String created_at;
  String updated_at;
  User? users;
  Desa? desa;

  factory Petugas.fromJson(Map<String, dynamic> json) => Petugas(
        petugas_id: json["petugas_id"],
        users_id: json["users_id"],
        desa_id: json["desa_id"],
        nama_petugas: json["nama_petugas"],
        alamat: json["alamat"],
        hp: json["hp"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        users: json["user"] != null ? User.fromJson(json["user"]) : null,
      );
}
