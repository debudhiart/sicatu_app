import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/kecamatan/kecamatan_create_page.dart';
import 'package:sicatu_app/presentation/pages/kecamatan/kecamatan_detail_page.dart';

import '../../../common/constants.dart';

class KecamatanViewPage extends StatelessWidget {
  const KecamatanViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Kecamatan',
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
                return KecamatanCreatePage();
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
                  CardKecamatan(kecamatan: 'Denpasar Selatan'),
                  CardKecamatan(kecamatan: 'Mengwitani'),
                  CardKecamatan(kecamatan: 'Kuta Selatan'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardKecamatan extends StatelessWidget {
  // const CardKecamatan({
  //   Key? key,
  // }) : super(key: key);

  String kecamatan;

  CardKecamatan({
    required this.kecamatan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return KecamatanDetailPage();
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
                    kecamatan,
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
