import 'package:flutter/material.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_petugas.dart';

import '../../common/constants.dart';
import '../pages/jadwal_petugas_page/jadwal_petugas_detail_page.dart';

class CardJadwalPetugasHari extends StatelessWidget {
  // const CardJadwalPetugasHari({Key? key}) : super(key: key);
  String hari;

  CardJadwalPetugasHari({
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
        CardJadwalPetugas(
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
