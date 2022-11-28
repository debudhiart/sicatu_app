import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/provinsi.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/provinsi_controller.dart';
import '../../service/provinsi_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';

class ProvinsiDetailPage extends StatefulWidget {
  //  ProvinsiDetailPage({Key? key}), required this.provinsi : super(key: key);
  var provinsi_id;
  ProvinsiDetailPage({required this.provinsi_id});

  @override
  State<ProvinsiDetailPage> createState() => _ProvinsiDetailPageState();
}

class _ProvinsiDetailPageState extends State<ProvinsiDetailPage> {
  var _provinsiDetailController = Get.put(ProvinsiController());

  final _provinsiService = Get.put(ProvinsiService());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _provinsiDetailController = Get.find<ProvinsiController>();
        } catch (e) {
          _provinsiDetailController = Get.put(ProvinsiController());
        }
        await _provinsiDetailController.getDetailProvinsi(widget.provinsi_id);
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Provinsi',
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
      bottomNavigationBar: Padding(
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
                    'Hapus Provinsi',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus provinsi ini?',
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
                  "Delete Provinsi",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        // print(_provinsiDetailController.detailProvinsi.nama_provinsi);
        child: Obx(() => _provinsiDetailController.isLoading.value
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
                                    _provinsiDetailController
                                            .detailProvinsi?.nama_provinsi ??
                                        "Nama Provinsi",
                                    // 'Bali',
                                    style: kHeading5Putih,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ProvinsiEditPage();
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
