import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class JenisLanggananEditPage extends StatelessWidget {
  JenisLanggananEditPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Edit Jenis Langganan',
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
                    'Nama Layanan',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    // controller: _namaController,
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
                      hintText: "ex: Reguler",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Nama Layanan dengan benar";
                      }
                      return null;
                    },
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
                    // controller: _namaController,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Desa dengan benar";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Harga',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    // controller: _namaController,
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
                      hintText: "ex: 10.000",
                      hintStyle: TextStyle(
                        color: placeholderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: kSubtitle,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukan Harga dengan benar";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 204,
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
