import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_view_page.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota/kabupaten_kota_view_page.dart';
import 'package:sicatu_app/presentation/pages/kecamatan/kecamatan_view_page.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_view_page.dart';

import '../../common/constants.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/wilayah_list_card.dart';

class WilayahPage extends StatelessWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Wilayah',
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DesaViewPage();
                      },
                    ),
                  );
                },
                child: WilayahListCard(
                  icon: Icons.villa,
                  title: "Desa",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return KecamatanViewPage();
                      },
                    ),
                  );
                },
                child: WilayahListCard(
                  icon: Icons.business_outlined,
                  title: "Kecamatan",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return KabupatenKotaViewPage();
                      },
                    ),
                  );
                },
                child: WilayahListCard(
                  icon: Icons.house_siding_outlined,
                  title: "Kabupaten dan Kota",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ProvinsiViewPage();
                      },
                    ),
                  );
                },
                child: WilayahListCard(
                  icon: Icons.water_damage_outlined,
                  title: "Provinsi",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
