import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class KeluhanMapsRumahPelangganPage extends StatelessWidget {
  const KeluhanMapsRumahPelangganPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Lokasi Rumah Pelanggan',
          style: GoogleFonts.inter(
            color: hitamColor,
            fontSize: 18,
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
          child: Container(
            decoration: BoxDecoration(
              color: softBlueColor,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 71.0, left: 150, right: 150),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.pin_drop_outlined,
                        color: placeholderColor,
                      ),
                      Text(
                        'Maps',
                        style: TextStyle(color: placeholderColor),
                      ),
                    ],
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
