import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_edit_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_maps_lokasi_penjemputan_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_maps_rumah_pelanggan_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_edit_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_maps_lokasi_penjemputan_page.dart';
import 'package:sicatu_app/presentation/pages/keluhan_page/keluhan_maps_rumah_pelanggan_page.dart';

import '../../../common/constants.dart';
import '../../controller/keluhan_controller.dart';
import '../../service/keluhan_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class KeluhanDetailPage extends StatefulWidget {
  // const KeluhanDetailPage({Key? key}) : super(key: key);
  var keluhan_id;
  KeluhanDetailPage({required this.keluhan_id});

  @override
  State<KeluhanDetailPage> createState() => _KeluhanDetailPageState();
}

class _KeluhanDetailPageState extends State<KeluhanDetailPage> {
  int roles_id = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _keluhanDetailController = Get.find<KeluhanController>();
        } catch (e) {
          _keluhanDetailController = Get.put(KeluhanController());
        }
        await _keluhanDetailController.getDetailKeluhan(widget.keluhan_id);
      },
    );
    super.initState();
    _loadUserData();
  }

  var _keluhanDetailController = Get.put(KeluhanController());

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      setState(() {
        roles_id = user['roles_id'];
        print(roles_id);
      });
    }
  }

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
        child: Obx(() => _keluhanDetailController.isLoading.value
            ? Center(
                child: SearchLoading(
                  title: 'Loading Get Data Detail ',
                  subtitle: '',
                ),
                // CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 36,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: merahColor,
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              if (_keluhanDetailController
                                          .detailKeluhan?.status_keluhan ==
                                      "Keluhan Ditolak" ||
                                  _keluhanDetailController
                                          .detailKeluhan?.status_keluhan ==
                                      "Gagal Diproses") {
                                return Container(
                                  height: 36,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: merahColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16.0, left: 16.0),
                                        child: Text(
                                          _keluhanDetailController.detailKeluhan
                                                  ?.status_keluhan ??
                                              'Status Keluhan',
                                          style: kstatustittle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else if (_keluhanDetailController
                                          .detailKeluhan?.status_keluhan ==
                                      "Sedang Diproses" ||
                                  _keluhanDetailController
                                          .detailKeluhan?.status_keluhan ==
                                      "Menunggu Verifikasi") {
                                return Container(
                                  height: 36,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: kuningColor,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16.0, left: 16.0),
                                        child: Text(
                                          _keluhanDetailController.detailKeluhan
                                                  ?.status_keluhan ??
                                              'Status Keluhan',
                                          style: kstatustittle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                                // Text("Y is greater than or equal to 10");

                              } else {
                                return Container(
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
                                        padding: const EdgeInsets.only(
                                            right: 16.0, left: 16.0),
                                        child: Text(
                                          _keluhanDetailController.detailKeluhan
                                                  ?.status_keluhan ??
                                              'Status Keluhan',
                                          style: kstatustittle,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
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
                                      _keluhanDetailController.detailKeluhan
                                              ?.pelanggan?.nama_pelanggan ??
                                          'Nama Pelanggan',
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
                                _keluhanDetailController
                                        .detailKeluhan?.desa?.nama_desa ??
                                    "Desa",
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      _keluhanDetailController
                                              .detailKeluhan?.keluhan ??
                                          'data keluhan',
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    LayoutBuilder(
                                      builder: (context, constraints) {
                                        if (_keluhanDetailController
                                                .detailKeluhan?.respon !=
                                            null) {
                                          return Text(_keluhanDetailController
                                                  .detailKeluhan?.respon ??
                                              "Respon");
                                        } else {
                                          return Text("Belum direspon");
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            border:
                                                Border.all(color: Colors.white),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            border:
                                                Border.all(color: Colors.white),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return KeluhanMapsRumahPelangganPage();
                                        },
                                      ),
                                    );
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return KeluhanMapsLokasiPenjemputanPage();
                                        },
                                      ),
                                    );
                                  },
                                  child:
                                      Text("Lihat Lokasi Penjemputan Sampah"),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  if (roles_id == 1 ||
                                      roles_id == 2 ||
                                      roles_id == 5) {
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
                                                    Navigator.pop(
                                                        context, 'Hapus');
                                                  },
                                                  child: Text(
                                                    'Hapus',
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        color: merahColor),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
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
                                              "Delete Keluhan",
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
                              SizedBox(height: 24),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
      ),
    );
  }
}