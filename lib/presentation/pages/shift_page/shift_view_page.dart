import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/shift_create_page.dart';
// import 'package:sicatu_app/presentation/pages/shift_detail_page.dart';
import 'package:sicatu_app/presentation/pages/shift_page/shift_create_page.dart';
import 'package:sicatu_app/presentation/pages/shift_page/shift_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
// import '../widgets/navigation_drawer.dart';

class ShiftViewPage extends StatelessWidget {
  const ShiftViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Shift',
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
                return ShiftCreatePage();
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
                childAspectRatio: 4.8 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                children: <Widget>[
                  CardShift(
                    shift: 'Ya',
                  ),
                  CardShift(
                    shift: 'Tidak',
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

class CardShift extends StatelessWidget {
  // const CardShift({
  //   Key? key,
  // }) : super(key: key);
  String shift;

  CardShift({
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ShiftDetailPage();
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
                  shift,
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
