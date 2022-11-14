import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class UserEditProfilePage extends StatelessWidget {
  UserEditProfilePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile User',
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 41,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Test Gesture Ganti Foto');
                    },
                    child: CircleAvatar(
                      child: CircleAvatar(
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: placeholderColor,
                        ),
                        radius: 72,
                        backgroundColor: softBlueColor,
                      ),
                      radius: 75,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Form(
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
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                        'Email',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Email dengan benar";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        // cursorColor: softBlueColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                          hintText: "ex: debudhiart@gmail.com",
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
                        'Alamat',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Alamat dengan benar";
                          }
                          return null;
                        },
                        // cursorColor: softBlueColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                          hintText: "ex: Jalan Veteran kebangsaan",
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
                        'Role',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Role dengan benar";
                          }
                          return null;
                        },
                        // cursorColor: softBlueColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                          hintText: "ex: User",
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
                        'Nomor Handphone',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Nomor Handphone dengan benar";
                          }
                          return null;
                        },
                        // cursorColor: softBlueColor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
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
                          hintText: "ex: 085632563254",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        keyboardType: TextInputType.number,

                        // controller: fullNameController,
                      ),
                      SizedBox(
                        height: 24,
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
