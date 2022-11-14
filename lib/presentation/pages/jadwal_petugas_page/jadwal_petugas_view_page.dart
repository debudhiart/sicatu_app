import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_petugas_page/jadwal_petugas_create_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_petugas_page/jadwal_petugas_detail_page.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_petugas_hari.dart';

import '../../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../../common/constants.dart';
// import '../widgets/navigation_drawer.dart';

class JadwalPetugasViewPage extends StatelessWidget {
  const JadwalPetugasViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jadwal Petugas',
          style: GoogleFonts.inter(
            color: hitamColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: biruColor),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: biruColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return JadwalPetugasCreatePage();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                CardJadwalPetugasHari(
                  hari: 'Senin',
                ),
                CardJadwalPetugasHari(
                  hari: 'Selasa',
                ),
                CardJadwalPetugasHari(
                  hari: 'Rabu',
                ),
                CardJadwalPetugasHari(
                  hari: 'Kamis',
                ),
                CardJadwalPetugasHari(
                  hari: 'Jumat',
                ),
                CardJadwalPetugasHari(
                  hari: 'Sabtu',
                ),
                CardJadwalPetugasHari(
                  hari: 'Minggu',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
