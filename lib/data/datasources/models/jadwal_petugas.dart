import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/petugas.dart';
import 'package:sicatu_app/data/datasources/models/shift.dart';

class JadwalPetugas {
  JadwalPetugas({
    required this.jadwal_petugas_id,
    this.shift_id,
    this.petugas_id,
    this.desa_id,
    required this.hari,
    required this.created_at,
    required this.updated_at,
    this.shift,
    this.petugas,
    this.desa,
  });
  int jadwal_petugas_id;
  int? shift_id;
  int? petugas_id;
  int? desa_id;
  String hari;

  String created_at;
  String updated_at;
  Shift? shift;
  Petugas? petugas;
  Desa? desa;

  factory JadwalPetugas.fromJson(Map<String, dynamic> json) => JadwalPetugas(
        jadwal_petugas_id: json["jadwal_petugas_id"],
        shift_id: json["shift_id"],
        petugas_id: json["petugas_id"],
        desa_id: json["desa_id"],
        hari: json["hari"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        shift: json["shift"] != null ? Shift.fromJson(json["shift"]) : null,
        petugas:
            json["petugas"] != null ? Petugas.fromJson(json["petugas"]) : null,
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
      );
}
