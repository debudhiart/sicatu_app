import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class KeluhanCreatePage extends StatelessWidget {
  KeluhanCreatePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Create Keluhan',
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
          child: Padding(
            padding: const EdgeInsets.only(
                top: 44.0, bottom: 16.0, right: 16.0, left: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Nama',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Nama dengan benar";
                      }
                      return null;
                    },
                    // cursorColor: softBlueColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        // borderSide: BorderSide.none,
                      ),
                      fillColor: softBlueColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: "ex: Budhi Arta",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    // controller: fullNameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Desa',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Nama Desa dengan benar";
                      }
                      return null;
                    },
                    // cursorColor: softBlueColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        // borderSide: BorderSide.none,
                      ),
                      fillColor: softBlueColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: "ex: Pecatu",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    // controller: fullNameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Keluhan',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Keluhan dengan benar";
                      }
                      return null;
                    },
                    // cursorColor: softBlueColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        // borderSide: BorderSide.none,
                      ),
                      fillColor: softBlueColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText:
                          "ex: Terdapat sampah menumpuk di sepanjangan jalan kenangan kita slalu bergandeng tangan",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 6,
                    // controller: fullNameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Status Keluhan',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Status dengan benar";
                      }
                      return null;
                    },
                    // cursorColor: softBlueColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        // borderSide: BorderSide.none,
                      ),
                      fillColor: softBlueColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: "ex: Menunggu Verifikasi",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    keyboardType: TextInputType.multiline,
                    // controller: fullNameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Respon',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Respon dengan benar";
                      }
                      return null;
                    },
                    // cursorColor: softBlueColor,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        // borderSide: BorderSide.none,
                      ),
                      fillColor: softBlueColor,
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      hintText: "ex: Sampah sudah diatasi oleh petugas terkait",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    keyboardType: TextInputType.multiline,
                    minLines: 4,
                    maxLines: 6,
                    // controller: fullNameController,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return KeluhanMapsRumahPelangganPage();
                          //     },
                          //   ),
                          // );
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
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return KeluhanMapsLokasiPenjemputanPage();
                          //     },
                          //   ),
                          // );
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
                    height: 22,
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
                        if (_formKey.currentState!.validate()) {
                          print('Berhasil Edit');
                        } else {}
                      },
                      child: Text("Save"),
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 54,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.transparent,
                        minimumSize: Size(318, 44),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: biruColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
