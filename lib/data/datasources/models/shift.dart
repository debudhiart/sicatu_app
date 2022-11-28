class Shift {
  Shift({
    required this.shift_id,
    required this.shift,
    this.created_at,
    this.updated_at,
  });
  int shift_id;
  String shift;
  String? created_at;
  String? updated_at;

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        shift_id: json["shift_id"],
        shift: json["shift"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
