import 'package:sicatu_app/data/datasources/models/Provinsi.dart';

class KabupatenKota {
  KabupatenKota({
    required this.kabupaten_kota_id,
    required this.provinsi_id,
    required this.nama_kabupaten_kota,
    this.created_at,
    this.updated_at,
    required this.provinsi,
  });
  int kabupaten_kota_id;
  int provinsi_id;
  String nama_kabupaten_kota;
  String? created_at;
  String? updated_at;
  Provinsi? provinsi;

  factory KabupatenKota.fromJson(Map<String, dynamic> json) => KabupatenKota(
        kabupaten_kota_id: json["kabupaten_kota_id"],
        provinsi_id: json["provinsi_id"],
        nama_kabupaten_kota: json["nama_kabupaten_kota"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // provinsi: List<Provinsi>.from(
        //     json["provinsi"].map((x) => Provinsi.fromJson(x))),
        provinsi: json["provinsi"] != null
            ? Provinsi.fromJson(json["provinsi"])
            : null,
      );
}
