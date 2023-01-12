import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/desa.dart';
// import 'package:sicatu_app/presentation/pages/desa_edit_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_edit_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_view_page.dart';

import '../../../common/constants.dart';
import '../../controller/desa_controller.dart';
import '../../service/desa_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class DesaDetailPage extends StatefulWidget {
  // const DesaDetailPage({Key? key}) : super(key: key);
  var desa_id;
  DesaDetailPage({required this.desa_id});

  @override
  State<DesaDetailPage> createState() => _DesaDetailPageState();
}

class _DesaDetailPageState extends State<DesaDetailPage> {
  var _desaDetailController = Get.put(DesaController());
  Desa? desa;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _desaDetailController = Get.find<DesaController>();
        } catch (e) {
          _desaDetailController = Get.put(DesaController());
        }
        desa = await _desaDetailController.getDetailDesa(widget.desa_id);
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Desa',
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
                    'Hapus Desa',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus desa ini?',
                    style: kdescription14hitam,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        _desaDetailController.deleteDesa(widget.desa_id).then(
                          (value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DesaViewPage();
                                },
                              ),
                            );
                          },
                        );
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
                  "Delete Desa",
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
          () => _desaDetailController.isLoading.value
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
                                      _desaDetailController
                                              .detailDesa?.nama_desa ??
                                          "Nama Desa",
                                      // 'Pecatu',
                                      style: kHeading5Putih,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DesaEditPage(desa: desa!);
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
                                _desaDetailController.detailDesa?.kecamatan
                                        ?.nama_kecamatan ??
                                    "Kecamatan",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _desaDetailController.detailDesa?.kecamatan
                                        ?.kabupaten_kota?.nama_kabupaten_kota ??
                                    "Kabupaten Kota",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _desaDetailController
                                        .detailDesa
                                        ?.kecamatan
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
