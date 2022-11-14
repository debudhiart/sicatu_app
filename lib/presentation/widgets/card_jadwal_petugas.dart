import 'package:flutter/material.dart';

import '../../common/constants.dart';
import '../pages/jadwal_petugas_page/jadwal_petugas_detail_page.dart';

class CardJadwalPetugas extends StatelessWidget {
  // CardJadwalPetugas({Key? key}) : super(key: key);

  String nama;
  String desa;

  CardJadwalPetugas({
    required this.nama,
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return JadwalPetugasDetailPage();
            },
          ),
        );
      },
      child: Container(
        height: 100,
        child: Card(
          color: softBlueColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(nama, style: ktittle),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          desa,
                          style: kdescription,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
