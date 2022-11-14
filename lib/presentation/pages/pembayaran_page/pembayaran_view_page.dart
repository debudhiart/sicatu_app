import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/common/constants.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_create_page.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_detail_page.dart';
import 'package:sicatu_app/presentation/pages/pembayaran_page/pembayaran_create_page.dart';
import 'package:sicatu_app/presentation/pages/pembayaran_page/pembayaran_detail_page.dart';

// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class PembayaranViewPage extends StatelessWidget {
  const PembayaranViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Pembayaran',
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
                return PembayaranCreatePage();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CardPembayaran(
                  nama: 'Budhi Arta K Giri',
                  desa: 'Pecatu',
                  harga: 'Rp. 10.000',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardPembayaran extends StatelessWidget {
  // const CardPembayaran({
  //   Key? key,
  // }) : super(key: key);

  String nama;
  String desa;
  String harga;

  CardPembayaran({
    required this.nama,
    required this.desa,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PembayaranDetailPage();
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
                    Text(harga, style: kdescription),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
