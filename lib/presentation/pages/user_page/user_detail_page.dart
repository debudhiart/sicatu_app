import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/data/datasources/models/user.dart';
import 'package:sicatu_app/presentation/controller/users_controller.dart';
// import 'package:sicatu_app/presentation/pages/user_edit_profile_page.dart';
// import 'package:sicatu_app/presentation/pages/user_maps_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_edit_profile_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_maps_page.dart';
import 'package:sicatu_app/presentation/service/user_service.dart';
import 'package:sicatu_app/presentation/widgets/search_loading.dart';

import '../../../common/constants.dart';
import '../../controller/user_detail_controller.dart';
// import '../../common/constants.dart';

class UserDetailPage extends StatefulWidget {
  // UserDetailPage({Key? key}) : super(key: key);

  int users_id;

  UserDetailPage({required this.users_id});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _userDetailController = Get.find<UserDetailController>();
        } catch (e) {
          _userDetailController = Get.put(UserDetailController());
        }
        await _userDetailController.getDetailUser(widget.users_id);
      },
    );
    _loadUserData();
    super.initState();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      setState(() {
        roles_id = user['roles_id'];
      });
    }
  }

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
        child: Obx(
          () => _userDetailController.isLoading.value
              ? Center(
                  child: SearchLoading(
                      title: 'Loading Get Detai User', subtitle: ''),
                )
              : SingleChildScrollView(
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
                              offset:
                                  Offset(0, 0), // changes position of shadow
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
                                  padding:
                                      const EdgeInsets.only(top: 68, left: 22),
                                  child: CircleAvatar(
                                    child: CircleAvatar(
                                      child:
                                          Icon(Icons.account_circle_outlined),
                                      radius: 72,
                                      backgroundColor: biruColor,
                                    ),
                                    radius: 75,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    if (roles_id == 1 || roles_id == 2) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
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
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ],
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                if (roles_id == 1 || roles_id == 2) {
                                  return SizedBox(
                                    height: 9,
                                  );
                                } else {
                                  return SizedBox(
                                    height: 33,
                                  );
                                }
                              },
                            ),
                            Text(
                              _userDetailController.detailUser?.nama ?? "Nama",
                              style: kHeading5,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              _userDetailController
                                      .detailUser?.desa?.nama_desa ??
                                  "Desa",
                              style: kBodyText,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              _userDetailController.detailUser?.email ??
                                  "Email",
                              style: kBodyText,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              _userDetailController.detailUser?.address ??
                                  "Alamat",
                              style: kBodyText,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              _userDetailController
                                      .detailUser?.role?.nama_role ??
                                  "Role",
                              style: kBodyText,
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                if (_userDetailController
                                        .detailUser?.pelanggan !=
                                    null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _userDetailController
                                                .detailUser?.pelanggan?.hp ??
                                            "No Hp Pelanggan",
                                        style: kBodyText,
                                      ),
                                    ],
                                  );
                                } else if (_userDetailController
                                        .detailUser?.operator !=
                                    null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _userDetailController
                                                .detailUser?.operator?.hp ??
                                            "No Hp Operator",
                                        style: kBodyText,
                                      ),
                                    ],
                                  );
                                } else if (_userDetailController
                                        .detailUser?.petugas !=
                                    null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _userDetailController
                                                .detailUser?.petugas?.hp ??
                                            "No Hp Petugas",
                                        style: kBodyText,
                                      ),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                if (_userDetailController
                                        .detailUser?.pelanggan !=
                                    null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Lokasi Rumah",
                                        style: kBodyText,
                                      ),
                                      SizedBox(
                                        height: 9,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                      SizedBox(),
                                    ],
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                if (roles_id == 1 || roles_id == 2) {
                                  return SizedBox(
                                    height: 9,
                                  );
                                } else {
                                  return SizedBox(
                                    height: 22,
                                  );
                                }
                              },
                            ),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                if (roles_id == 1 || roles_id == 2) {
                                  return SizedBox(
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
                                          builder: (BuildContext context) =>
                                              AlertDialog(
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
                                                  Navigator.pop(
                                                      context, 'Hapus');
                                                },
                                                child: Text(
                                                  'Hapus',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: merahColor),
                                                ),
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: biruColor,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Kembali');
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
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
