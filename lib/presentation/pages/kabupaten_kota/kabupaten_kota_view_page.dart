import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota/kabupaten_kota_create_page.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota/kabupaten_kota_detail_page.dart';

import '../../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';

class KabupatenKotaViewPage extends StatelessWidget {
  const KabupatenKotaViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Kabupaten/Kota',
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
                return KabupatenKotaCreatePage();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                children: <Widget>[
                  CardKabupatenKota(kabupatenKota: 'Denpasar'),
                  CardKabupatenKota(kabupatenKota: 'Badung'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardKabupatenKota extends StatelessWidget {
  // const CardKabupatenKota({
  //   Key? key,
  // }) : super(key: key);

  String kabupatenKota;

  CardKabupatenKota({
    required this.kabupatenKota,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return KabupatenKotaDetailPage();
            },
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Card(
          color: softBlueColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(
                    kabupatenKota,
                    style: ktittle,
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
