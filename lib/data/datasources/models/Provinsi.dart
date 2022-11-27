class Provinsi {
  Provinsi({
    required this.provinsi_id,
    required this.nama_provinsi,
    this.created_at,
    this.updated_at,
  });
  int provinsi_id;

  String nama_provinsi;
  String? created_at;
  String? updated_at;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
        provinsi_id: json["provinsi_id"],
        nama_provinsi: json["nama_provinsi"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
