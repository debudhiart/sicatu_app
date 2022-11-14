import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_detail_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_create_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class KeluhanViewPage extends StatelessWidget {
  const KeluhanViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Keluhan',
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
                return KeluhanCreatePage();
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
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return KeluhanDetailPage();
                      },
                    ),
                  );
                },
                child: CardKeluhan(
                    nama: 'Budhi Arta K Giri',
                    keluhan:
                        'Terdapat sampah menumpuk di sepanjangan jalan kenangan kita slalu bergandeng tangan',
                    desa: 'Pecatu'),
              ),
              // Text(snapshot.data['data'][index]['nama'])
            ],
          ),
        ),
      ),
    );
  }
}

class CardKeluhan extends StatelessWidget {
  // const CardKeluhan({
  //   Key? key,
  // }) : super(key: key);

  String nama;
  String keluhan;
  String desa;

  CardKeluhan({
    required this.nama,
    required this.keluhan,
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
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
                      Container(
                        width: 250,
                        child: Text(
                          keluhan,
                          style: kdescriptionhitam,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(desa, style: kdescription),
              // Text(snapshot.data['data'][index]['role'][index]
              //     ['nama_role']),
            ],
          ),
        ),
      ),
    );
  }
}
