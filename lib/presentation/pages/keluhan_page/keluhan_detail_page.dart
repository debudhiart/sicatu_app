import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_edit_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_maps_lokasi_penjemputan_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_maps_rumah_pelanggan_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_edit_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_maps_lokasi_penjemputan_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_maps_rumah_pelanggan_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class KeluhanDetailPage extends StatelessWidget {
  const KeluhanDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Keluhan',
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 159,
                    decoration: BoxDecoration(
                      color: biruColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.05),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 36,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: hijauColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Text(
                            'Sudah Ditangani',
                            style: kstatustittle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 108,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Budhi Arta K Giri',
                                style: kHeading5Putih,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return KeluhanEditPage();
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Panjer",
                          style: kBodyText,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Keluhan",
                          style: kBodyText,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 22.0,
                            bottom: 22.0,
                          ),
                          decoration: BoxDecoration(
                            color: softBlueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                'Terdapat sampah menumpuk di sepanjangan jalan kenangan kita slalu bergandeng tangan',
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Respon",
                          style: kBodyText,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          padding: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 22.0,
                            bottom: 22.0,
                          ),
                          decoration: BoxDecoration(
                            color: softBlueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Sampah sudah diatasi oleh petugas terkait',
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return KeluhanMapsRumahPelangganPage();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "Before",
                                    style: kBodyText,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: softBlueColor,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.photo,
                                        color: placeholderColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return KeluhanMapsLokasiPenjemputanPage();
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    "After",
                                    style: kBodyText,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: softBlueColor,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(
                                        Icons.photo,
                                        color: placeholderColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lokasi Rumah Pelanggan",
                          style: kBodyText,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: biruColor,
                              minimumSize: Size(318, 44),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return UserMapsPage();
                              //     },
                              //   ),
                              // );
                            },
                            child: Text("Lihat Lokasi Rumah Pelanggan"),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Lokasi Penjemputan Sampah",
                          style: kBodyText,
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: biruColor,
                              minimumSize: Size(318, 44),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return UserMapsPage();
                              //     },
                              //   ),
                              // );
                            },
                            child: Text("Lihat Lokasi Penjemputan Sampah"),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: merahColor,
                              minimumSize: Size(318, 44),
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: Text(
                                    'Hapus Keluhan',
                                    style: kalerttittle,
                                  ),
                                  content: Text(
                                    'Yakin ingin hapus keluhan ini?',
                                    style: kdescription14hitam,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'Hapus');
                                      },
                                      child: Text(
                                        'Hapus',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: merahColor),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: biruColor,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context, 'Kembali');
                                      },
                                      child: Text('Kembali'),
                                    )
                                    // TextButton(
                                    //   onPressed: () => Navigator.pop(context, 'Kembali'),
                                    //   child: Text('Kembali'),
                                    // ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Delete Shift",
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
