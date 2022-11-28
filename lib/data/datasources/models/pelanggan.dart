import 'dart:ffi';

import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/jenis_langganan.dart';
// import 'package:sicatu_app/data/datasources/models/Role.dart';
import 'package:sicatu_app/data/datasources/models/user.dart';

class Pelanggan {
  Pelanggan({
    required this.pelanggan_id,
    this.users_id,
    this.desa_id,
    this.jenis_langganan_id,
    required this.nama_pelanggan,
    required this.alamat,
    this.hp,
    this.lat,
    this.lng,
    required this.created_at,
    required this.updated_at,
    this.users,
    this.desa,
    this.jenis_langganan,
  });
  int pelanggan_id;
  int? users_id;
  int? desa_id;
  int? jenis_langganan_id;
  String nama_pelanggan;
  String alamat;
  String? hp;
  double? lat;
  double? lng;
  String created_at;
  String updated_at;
  User? users;
  Desa? desa;
  JenisLangganan? jenis_langganan;

  factory Pelanggan.fromJson(Map<String, dynamic> json) => Pelanggan(
        pelanggan_id: json["pelanggan_id"],
        users_id: json["users_id"],
        desa_id: json["desa_id"],
        jenis_langganan_id: json["jenis_langganan_id"],
        nama_pelanggan: json["nama_pelanggan"],
        alamat: json["alamat"],
        hp: json["hp"],
        lat: json["lat"],
        lng: json["lng"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        users: json["user"] != null ? User.fromJson(json["user"]) : null,
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        jenis_langganan: json["jenis_langganan"] != null
            ? JenisLangganan.fromJson(json["jenis_langganan"])
            : null,
      );
}
