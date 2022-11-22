import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_create_page.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_detail_page.dart';

import '../../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';

class ProvinsiViewPage extends StatelessWidget {
  const ProvinsiViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Provinsi',
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
                return ProvinsiCreatePage();
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
                  CardProvinsi(provinsi: 'Bali'),
                  CardProvinsi(provinsi: 'Jawa Timur'),
                  CardProvinsi(provinsi: 'Jawa Barat'),
                  CardProvinsi(provinsi: 'Jawa Tengah'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardProvinsi extends StatelessWidget {
  // const CardProvinsi({
  //   Key? key,
  // }) : super(key: key);

  String provinsi;

  CardProvinsi({
    required this.provinsi,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProvinsiDetailPage();
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
                Text(
                  provinsi,
                  style: ktittle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
