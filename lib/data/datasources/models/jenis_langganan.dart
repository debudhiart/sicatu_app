import 'package:sicatu_app/data/datasources/models/desa.dart';

class JenisLangganan {
  JenisLangganan({
    required this.jenis_langganan_id,
    required this.desa_id,
    required this.nama_jenis_langganan,
    required this.harga,
    this.created_at,
    this.updated_at,
    this.desa,
  });
  int jenis_langganan_id;
  int desa_id;
  String nama_jenis_langganan;
  int harga;
  String? created_at;
  String? updated_at;
  Desa? desa;

  factory JenisLangganan.fromJson(Map<String, dynamic> json) => JenisLangganan(
        jenis_langganan_id: json["jenis_langganan_id"],
        desa_id: json["desa_id"],
        nama_jenis_langganan: json["nama_jenis_langganan"],
        harga: json["harga"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // kabupaten_kota: List<KabupatenKota>.from(
        //     json["kabupaten_kota"].map((x) => KabupatenKota.fromJson(x))),
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
      );
}
