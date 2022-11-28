import 'package:sicatu_app/data/datasources/models/kecamatan.dart';

class Desa {
  Desa({
    required this.desa_id,
    required this.kecamatan_id,
    required this.nama_desa,
    required this.created_at,
    required this.updated_at,
    this.kecamatan,
  });
  int desa_id;
  int kecamatan_id;
  String nama_desa;
  String created_at;
  String updated_at;
  Kecamatan? kecamatan;

  factory Desa.fromJson(Map<String, dynamic> json) => Desa(
        desa_id: json["desa_id"],
        kecamatan_id: json["kecamatan_id"],
        nama_desa: json["nama_desa"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        // kecamatan: List<Kecamatan>.from(
        //     json["kecamatan"].map((x) => Kecamatan.fromJson(x))),
        kecamatan: json["kecamatan"] != null
            ? Kecamatan.fromJson(json["kecamatan"])
            : null,
      );
}
