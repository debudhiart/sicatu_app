import 'package:flutter/material.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_pelanggan.dart';

import '../../common/constants.dart';
import '../pages/jadwal_pelanggan_page/jadwal_pelanggan_detail_page.dart';

class CardJadwalPelangganHari extends StatelessWidget {
  // const CardJadwalPelangganHari({Key? key}) : super(key: key);

  String nama;
  String desa;
  // String hari;

  // JenisLangganan? jenisLangganan;

  CardJadwalPelangganHari({
    // required this.jenisLangganan,
    // required this.hari,
    required this.nama,
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardJadwalPelanggan(
          nama: nama,
          desa: desa,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
