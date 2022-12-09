import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_edit_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_page/jadwal_pelanggan_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/jadwal_pelanggan_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/jadwal_pelanggan_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';
// import '../widgets/navigation_drawer.dart';

class JadwalPelangganDetailPage extends StatefulWidget {
  // const JadwalPelangganDetailPage({Key? key}) : super(key: key);
  var jadwal_pelanggan_id;
  JadwalPelangganDetailPage({required this.jadwal_pelanggan_id});

  @override
  State<JadwalPelangganDetailPage> createState() =>
      _JadwalPelangganDetailPageState();
}

class _JadwalPelangganDetailPageState extends State<JadwalPelangganDetailPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  var _jadwalPelangganDetailController = Get.put(JadwalPelangganController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _jadwalPelangganDetailController =
              Get.find<JadwalPelangganController>();
        } catch (e) {
          _jadwalPelangganDetailController =
              Get.put(JadwalPelangganController());
        }
        await _jadwalPelangganDetailController
            .getDetailJadwalPelanggan(widget.jadwal_pelanggan_id);
      },
    );
    super.initState();
    _loadUserData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Jadwal Pelanggan',
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
      bottomNavigationBar: LayoutBuilder(
        builder: (context, constraints) {
          if (roles_id == 1 || roles_id == 2) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: SizedBox(
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
                          'Hapus Jadwal Pelanggan',
                          style: kalerttittle,
                        ),
                        content: Text(
                          'Yakin ingin hapus jadwal pelanggan ini?',
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
                        "Delete Jadwal Pelanggan",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
      body: SafeArea(
        child: Obx(
          () => _jadwalPelangganDetailController.isLoading.value
              ? Center(
                  child: SearchLoading(
                    title: 'Loading Get Data Detail ',
                    subtitle: '',
                  ),
                  // CircularProgressIndicator(),
                )
              : Column(
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 16.0, left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 108,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _jadwalPelangganDetailController
                                              .detailJadwalPelanggan
                                              ?.pelanggan
                                              ?.nama_pelanggan ??
                                          'Nama',
                                      style: kHeading5Putih,
                                    ),
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        if (roles_id == 1 || roles_id == 2) {
                                          return IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return JadwalPelangganEditPage();
                                                  },
                                                ),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              size: 30,
                                              color: Colors.white,
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
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  if (roles_id == 1 || roles_id == 2) {
                                    return SizedBox(
                                      height: 9,
                                    );
                                  } else {
                                    return SizedBox(
                                      height: 39,
                                    );
                                  }
                                },
                              ),
                              Text(
                                _jadwalPelangganDetailController
                                        .detailJadwalPelanggan
                                        ?.desa
                                        ?.nama_desa ??
                                    "Desa",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _jadwalPelangganDetailController
                                        .detailJadwalPelanggan?.hari ??
                                    "Hari",
                                style: kBodyText,
                              ),
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
