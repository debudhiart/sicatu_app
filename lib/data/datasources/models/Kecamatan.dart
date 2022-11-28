import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';

class Kecamatan {
  Kecamatan({
    required this.kecamatan_id,
    required this.kabupaten_kota_id,
    required this.nama_kecamatan,
    this.created_at,
    this.updated_at,
    required this.kabupaten_kota,
  });
  int kecamatan_id;
  int kabupaten_kota_id;
  String nama_kecamatan;
  String? created_at;
  String? updated_at;
  KabupatenKota? kabupaten_kota;

  factory Kecamatan.fromJson(Map<String, dynamic> json) => Kecamatan(
        kecamatan_id: json["kecamatan_id"],
        kabupaten_kota_id: json["kabupaten_kota_id"],
        nama_kecamatan: json["nama_kecamatan"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // kabupaten_kota: List<KabupatenKota>.from(
        //     json["kabupaten_kota"].map((x) => KabupatenKota.fromJson(x))),
        kabupaten_kota: json["kabupaten_kota"] != null
            ? KabupatenKota.fromJson(json["kabupaten_kota"])
            : null,
      );
}
