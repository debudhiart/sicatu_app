import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_page/jadwal_pelanggan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_page/jadwal_pelanggan_detail_page.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_pelanggan_hari.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class JadwalPelangganViewPage extends StatelessWidget {
  const JadwalPelangganViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jadwal Pelanggan',
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
                return JadwalPelangganCreatePage();
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
                CardJadwalPelangganHari(
                  hari: 'Senin',
                ),
                CardJadwalPelangganHari(
                  hari: 'Selasa',
                ),
                CardJadwalPelangganHari(
                  hari: 'Rabu',
                ),
                CardJadwalPelangganHari(
                  hari: 'Kamis',
                ),
                CardJadwalPelangganHari(
                  hari: 'Jumat',
                ),
                CardJadwalPelangganHari(
                  hari: 'Sabtu',
                ),
                CardJadwalPelangganHari(
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
