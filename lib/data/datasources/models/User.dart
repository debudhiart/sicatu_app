import 'package:sicatu_app/data/datasources/models/Desa.dart';
import 'package:sicatu_app/data/datasources/models/Role.dart';

class User {
  User({
    required this.users_id,
    this.roles_id,
    this.desa_id,
    required this.nama,
    required this.email,
    required this.address,
    this.photo,
    required this.created_at,
    required this.updated_at,
    this.desa,
    this.role,
  });
  int users_id;
  int? roles_id;
  int? desa_id;
  String nama;
  String email;
  String address;
  String? photo;
  String created_at;
  String updated_at;
  Desa? desa;
  Role? role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        users_id: json["users_id"],
        roles_id: json["roles_id"],
        desa_id: json["desa_id"],
        nama: json["nama"],
        email: json["email"],
        address: json["address"],
        photo: json["photo"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        desa: json["desa"] != null ? Desa.fromJson(json["desa"]) : null,
        role: json["role"] != null ? Role.fromJson(json["role"]) : null,
      );
}
