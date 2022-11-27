class Role {
  Role({
    required this.roles_id,
    required this.nama_role,
    this.created_at,
    this.updated_at,
  });
  int roles_id;
  String nama_role;
  String? created_at;
  String? updated_at;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        roles_id: json["roles_id"],
        nama_role: json["nama_role"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
