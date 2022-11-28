import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';

class Jabatan {
  Jabatan({
    required this.jabatan_id,
    required this.desa_id,
    required this.nama_jabatan,
    this.created_at,
    this.updated_at,
    required this.desa,
  });
  int jabatan_id;
  int desa_id;
  String nama_jabatan;
  String? created_at;
  String? updated_at;
  Desa? desa;

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        jabatan_id: json["jabatan_id"],
        desa_id: json["desa_id"],
        nama_jabatan: json["nama_jabatan"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // kabupaten_kota: List<KabupatenKota>.from(
        //     json["kabupaten_kota"].map((x) => KabupatenKota.fromJson(x))),
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
      );
}
