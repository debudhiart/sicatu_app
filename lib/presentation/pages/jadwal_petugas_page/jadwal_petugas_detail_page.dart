import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_edit_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_petugas_page/jadwal_petugas_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/jadwal_petugas_controller.dart';
import '../../service/jadwal_petugas_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class JadwalPetugasDetailPage extends StatefulWidget {
  // const JadwalPetugasDetailPage({Key? key}) : super(key: key);
  var jadwal_petugas_id;
  JadwalPetugasDetailPage({required this.jadwal_petugas_id});

  @override
  State<JadwalPetugasDetailPage> createState() =>
      _JadwalPetugasDetailPageState();
}

class _JadwalPetugasDetailPageState extends State<JadwalPetugasDetailPage> {
  var _jadwalPetugasDetailController = Get.put(JadwalPetugasController());

  final _jadwalPetugasService = Get.put(JadwalPetugasService());
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _jadwalPetugasDetailController = Get.find<JadwalPetugasController>();
        } catch (e) {
          _jadwalPetugasDetailController = Get.put(JadwalPetugasController());
        }
        await _jadwalPetugasDetailController
            .getDetailJadwalPetugas(widget.jadwal_petugas_id);
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
          'Detail Jadwal Petugas',
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
                    'Hapus Jadwal petugas',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus jadwal petugas ini?',
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
                  "Delete Jadwal petugas",
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
          () => _jadwalPetugasDetailController.isLoading.value
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
                                      _jadwalPetugasDetailController
                                              .detailJadwalPetugas
                                              ?.petugas
                                              ?.nama_petugas ??
                                          'Nama',
                                      style: kHeading5Putih,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return JadwalPetugasEditPage();
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
                                _jadwalPetugasDetailController
                                        .detailJadwalPetugas?.desa?.nama_desa ??
                                    "Desa",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                _jadwalPetugasDetailController
                                        .detailJadwalPetugas?.hari ??
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
