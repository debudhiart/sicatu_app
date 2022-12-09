import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_edit_page.dart';
import 'package:sicatu_app/presentation/pages/jabatan_page/jabatan_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/jabatan_controller.dart';
import '../../service/jabatan_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class JabatanDetailPage extends StatefulWidget {
  // const JabatanDetailPage({Key? key}) : super(key: key);
  var jabatan_id;
  JabatanDetailPage({required this.jabatan_id});

  @override
  State<JabatanDetailPage> createState() => _JabatanDetailPageState();
}

class _JabatanDetailPageState extends State<JabatanDetailPage> {
  var _jabatanDetailController = Get.put(JabatanController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _jabatanDetailController = Get.find<JabatanController>();
        } catch (e) {
          _jabatanDetailController = Get.put(JabatanController());
        }
        await _jabatanDetailController.getDetailJabatan(widget.jabatan_id);
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Jabatan',
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
                    'Hapus Jabatan',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus jabatan ini?',
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
                  "Delete Jabatan",
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
        child: Obx(() => _jabatanDetailController.isLoading.value
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
                                    _jabatanDetailController
                                            .detailJabatan?.nama_jabatan ??
                                        'Kepala Desa',
                                    style: kHeading5Putih,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return JabatanEditPage();
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
                              _jabatanDetailController
                                      .detailJabatan?.desa?.nama_desa ??
                                  "Desa",
                              style: kBodyText,
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
