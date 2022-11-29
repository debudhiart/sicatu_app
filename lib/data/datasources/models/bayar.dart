import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/operator.dart';
import 'package:sicatu_app/data/datasources/models/pelanggan.dart';

class Bayar {
  Bayar({
    required this.bayar_id,
    required this.desa_id,
    required this.pelanggan_id,
    required this.operator_id,
    required this.nominal,
    required this.tanggal,
    this.created_at,
    this.updated_at,
    this.desa,
    this.pelanggan,
    this.operator,
  });
  int bayar_id;
  int desa_id;
  String pelanggan_id;
  String operator_id;
  DateTime tanggal;
  int nominal;
  String? created_at;
  String? updated_at;
  Desa? desa;
  Pelanggan? pelanggan;
  Operator? operator;

  factory Bayar.fromJson(Map<String, dynamic> json) => Bayar(
        bayar_id: json["bayar_id"],
        desa_id: json["desa_id"],
        pelanggan_id: json["pelanggan_id"],
        operator_id: json["operator_id"],
        nominal: json["nominal"],
        tanggal: json["tanggal"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        pelanggan: json["pelanggan"] != null
            ? Pelanggan.fromJson(json["pelanggan"])
            : null,
        operator: json["operator"] != null
            ? Operator.fromJson(json["operator"])
            : null,
      );
}
