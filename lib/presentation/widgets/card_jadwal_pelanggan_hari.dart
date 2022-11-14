import 'package:flutter/material.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_pelanggan.dart';

import '../../common/constants.dart';
import '../pages/jadwal_pelanggan_page/jadwal_pelanggan_detail_page.dart';

class CardJadwalPelangganHari extends StatelessWidget {
  // const CardJadwalPelangganHari({Key? key}) : super(key: key);

  String hari;

  CardJadwalPelangganHari({
    required this.hari,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          hari,
          style: kHeading5,
        ),
        SizedBox(
          height: 25,
        ),
        CardJadwalPelanggan(
          nama: 'Budhi Arta K Giri',
          desa: 'Pecatu',
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
