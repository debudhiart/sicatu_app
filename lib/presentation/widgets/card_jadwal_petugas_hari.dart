import 'package:flutter/material.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_petugas.dart';

import '../../common/constants.dart';
import '../pages/jadwal_petugas_page/jadwal_petugas_detail_page.dart';

class CardJadwalPetugasHari extends StatelessWidget {
  // const CardJadwalPetugasHari({Key? key}) : super(key: key);
  // String hari;
  String nama;
  String desa;
  int id;

  CardJadwalPetugasHari({
    // required this.hari,
    required this.id,
    required this.nama,
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Text(
        //   hari,
        //   style: kHeading5,
        // ),

        CardJadwalPetugas(
          id: id,
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
