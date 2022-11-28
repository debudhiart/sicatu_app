import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/pelanggan.dart';
import 'package:sicatu_app/data/datasources/models/shift.dart';

class JadwalPelanggan {
  JadwalPelanggan({
    required this.jadwal_pelanggan_id,
    this.shift_id,
    this.pelanggan_id,
    this.desa_id,
    required this.hari,
    required this.created_at,
    required this.updated_at,
    this.shift,
    this.pelanggan,
    this.desa,
  });
  int jadwal_pelanggan_id;
  int? shift_id;
  int? pelanggan_id;
  int? desa_id;
  String hari;

  String created_at;
  String updated_at;
  Shift? shift;
  Pelanggan? pelanggan;
  Desa? desa;

  factory JadwalPelanggan.fromJson(Map<String, dynamic> json) =>
      JadwalPelanggan(
        jadwal_pelanggan_id: json["jadwal_pelanggan_id"],
        shift_id: json["shift_id"],
        pelanggan_id: json["pelanggan_id"],
        desa_id: json["desa_id"],
        hari: json["hari"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        shift: json["shift"] != null ? Shift.fromJson(json["shift"]) : null,
        pelanggan: json["pelanggan"] != null
            ? Pelanggan.fromJson(json["pelanggan"])
            : null,
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
      );
}
