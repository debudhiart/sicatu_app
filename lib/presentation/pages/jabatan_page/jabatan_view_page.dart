import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jabatan_page/jabatan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jabatan_page/jabatan_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class JabatanViewPage extends StatelessWidget {
  const JabatanViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jabatan',
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
                return JabatanCreatePage();
              },
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: 15,
          // snapshot.data['data'].length,
          itemBuilder: (BuildContext context, int index) {
            return CardJabatan(
              nama_jabatan: 'Kepala Desa',
              desa: 'Pecatu',
            );
            // Text(snapshot.data['data'][index]['nama'])
          },
        ),
      ),
    );
  }
}

class CardJabatan extends StatelessWidget {
  // const CardJabatan({
  //   Key? key,
  // }) : super(key: key);

  String nama_jabatan;
  String desa;

  CardJabatan({
    required this.desa,
    required this.nama_jabatan,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JabatanDetailPage(
                // users: snapshot.data['data'][index],
                ),
          ),
        );
      },
      child: Container(
        height: 140,
        child: Card(
          color: softBlueColor,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(nama_jabatan,
                        // snapshot.data['data'][index]['nama'],
                        style: ktittle),
                    // Text(
                    //   // snapshot.data['data'][index]['email'],
                    //   style: kdescriptionhitam,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      desa,
                      // snapshot.data['data'][index]['address'],
                      style: kdescription,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
