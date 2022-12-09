import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/kecamatan_page/kecamatan_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/kecamatan_controller.dart';
import '../../widgets/search_loading.dart';

class KecamatanDetailPage extends StatefulWidget {
  // const KecamatanDetailPage({Key? key}) : super(key: key);
  final int kecamatan_id;
  KecamatanDetailPage({required this.kecamatan_id});

  @override
  State<KecamatanDetailPage> createState() => _KecamatanDetailPageState();
}

class _KecamatanDetailPageState extends State<KecamatanDetailPage> {
  var _kecamatanDetailController = Get.put(KecamatanController());

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _kecamatanDetailController = Get.find<KecamatanController>();
        } catch (e) {
          _kecamatanDetailController = Get.put(KecamatanController());
        }
        await _kecamatanDetailController
            .getDetailKecamatan(widget.kecamatan_id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Kecamatan',
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
                    'Hapus Kecamatan',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus Kecamatan ini?',
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
                  "Delete Kecamatan",
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
        child: Obx(
          () => _kecamatanDetailController.isLoading.value
              ? Center(
                  child: SearchLoading(
                    title: 'Loading Get Data Kecamatan',
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
                                      _kecamatanDetailController.detailKecamatan
                                              ?.nama_kecamatan ??
                                          'Kecamatan',
                                      style: kHeading5Putih,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return KecamatanEditPage();
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
                                _kecamatanDetailController.detailKecamatan
                                        ?.kabupaten_kota?.nama_kabupaten_kota ??
                                    "Kabupaten Kota",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _kecamatanDetailController
                                        .detailKecamatan
                                        ?.kabupaten_kota
                                        ?.provinsi
                                        ?.nama_provinsi ??
                                    "Provinsi",
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
