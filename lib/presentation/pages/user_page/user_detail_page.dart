import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/User.dart';
// import 'package:sicatu_app/presentation/pages/user_edit_profile_page.dart';
// import 'package:sicatu_app/presentation/pages/user_maps_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_edit_profile_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_maps_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class UserDetailPage extends StatelessWidget {
  // UserDetailPage({Key? key}) : super(key: key);

  User users;

  UserDetailPage({required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
          child: Stack(
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 68, left: 22),
                          child: CircleAvatar(
                            child: CircleAvatar(
                              child: Icon(Icons.account_circle_outlined),
                              radius: 72,
                              backgroundColor: biruColor,
                            ),
                            radius: 75,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return UserEditProfilePage();
                                    },
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      users.nama,
                      style: kHeading5,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      users.desa?.nama_desa ?? "Desa",
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      users.email,
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      users.address,
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      users.role?.nama_role ?? "Role",
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    // Text(
                    //   "085536553596",
                    //   style: kBodyText,
                    // ),
                    // SizedBox(
                    //   height: 9,
                    // ),
                    Text(
                      "Lokasi Rumah",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return UserMapsPage();
                              },
                            ),
                          );
                        },
                        child: Text("Lihat Lokasi Rumah"),
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
                          primary: merahColor,
                          minimumSize: Size(318, 44),
                        ),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(
                                'Hapus User',
                                style: kalerttittle,
                              ),
                              content: Text(
                                'Yakin ingin hapus user ini?',
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
                                        decoration: TextDecoration.underline,
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Column(
      //   children: [
      //     Column(
      //       children: [
      //         Text(users['nama']),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Text(users['email']),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
