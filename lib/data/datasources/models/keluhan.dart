import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';
import 'package:sicatu_app/data/datasources/models/pelanggan.dart';

class Keluhan {
  Keluhan({
    required this.keluhan_id,
    required this.desa_id,
    required this.pelanggan_id,
    required this.keluhan,
    this.respon,
    this.status_keluhan,
    this.before_photo,
    this.after_photo,
    this.created_at,
    this.updated_at,
    this.desa,
    this.pelanggan,
  });
  int keluhan_id;
  int desa_id;
  int pelanggan_id;
  String keluhan;
  String? respon;
  String? status_keluhan;
  String? before_photo;
  String? after_photo;
  String? created_at;
  String? updated_at;
  Desa? desa;
  Pelanggan? pelanggan;

  factory Keluhan.fromJson(Map<String, dynamic> json) => Keluhan(
        keluhan_id: json["keluhan_id"],
        desa_id: json["desa_id"],
        pelanggan_id: json["pelanggan_id"],
        keluhan: json["keluhan"],
        respon: json["respon"],
        status_keluhan: json["status_keluhan"],
        before_photo: json["before_photo"],
        after_photo: json["after_photo"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        pelanggan: json["pelanggan"] != null
            ? Pelanggan.fromJson(json["pelanggan"])
            : null,
      );
}
