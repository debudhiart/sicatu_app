import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/desa_create_page.dart';
// import 'package:sicatu_app/presentation/pages/desa_detail_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_create_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class DesaViewPage extends StatelessWidget {
  const DesaViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final int gridCount;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Desa',
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
                return DesaCreatePage();
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DesaDetailPage();
                          },
                        ),
                      );
                    },
                    child: CardDesa(desa: 'Pecatu'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDesa extends StatelessWidget {
  // const CardDesa({
  //   Key? key,
  // }) : super(key: key);

  String desa;

  CardDesa({
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                desa,
                style: ktittle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
