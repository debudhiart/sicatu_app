import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_edit_page.dart';
import 'package:sicatu_app/presentation/pages/pembayaran_page/pembayaran_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/bayar_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class PembayaranDetailPage extends StatefulWidget {
  // const PembayaranDetailPage({Key? key}) : super(key: key);

  final int bayar_id;
  PembayaranDetailPage({required this.bayar_id});

  @override
  State<PembayaranDetailPage> createState() => _PembayaranDetailPageState();
}

class _PembayaranDetailPageState extends State<PembayaranDetailPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  var _bayarDetailController = Get.put(BayarController());

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _bayarDetailController = Get.find<BayarController>();
        } catch (e) {
          _bayarDetailController = Get.put(BayarController());
        }
        await _bayarDetailController.getDetailBayar(widget.bayar_id);
      },
    );
    super.initState();
    _loadUserData();
  }

  Future<void> _pullRefresh() async {
    _bayarDetailController.getDetailBayar(widget.bayar_id);
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
          'Detail Pembayaran',
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
        child: Obx(() => _bayarDetailController.isLoading.value
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
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
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
                                    _bayarDetailController.detailBayar
                                            ?.pelanggan?.nama_pelanggan ??
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
                                                  return PembayaranEditPage();
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
                              _bayarDetailController
                                      .detailBayar?.desa?.nama_desa ??
                                  "Desa",
                              style: kBodyText,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Admin Pencatat",
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
                                    _bayarDetailController.detailBayar?.operator
                                            ?.nama_operator ??
                                        'Nama Admin Pencatat',
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "Harga",
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
                                    _bayarDetailController.detailBayar?.nominal
                                            .toString() ??
                                        "Nominal",
                                  ),
                                ],
                              ),
                            ),
                            // Text(
                            //   "Rp. 10.000",
                            //   style: kBodyText,
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
      ),
    );
  }
}
