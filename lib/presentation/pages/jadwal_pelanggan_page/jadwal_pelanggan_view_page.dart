import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_page/jadwal_pelanggan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_page/jadwal_pelanggan_detail_page.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_pelanggan_hari.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../controller/jadwal_pelanggan_controller.dart';
import '../../service/jadwal_pelanggan_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../widgets/navigation_drawer.dart';

class JadwalPelangganViewPage extends StatelessWidget {
  // const JadwalPelangganViewPage({Key? key}) : super(key: key);
  final controller = Get.put(JadwalPelangganController());
  final service = Get.put(JadwalPelangganService());

  Future<void> _pullRefresh() async {
    controller.getJadwalPelanggan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jadwal Pelanggan',
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
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: biruColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return JadwalPelangganCreatePage();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          color: biruColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SearchLoading(
                        title: 'Loading Get Data Provinsi',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Senin',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),

// if(controller.listJadwalPelanggan[index].hari == "Senin"){

// }else{}

                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Senin"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),

                          Text(
                            'Selasa',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Selasa"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          Text(
                            'Rabu',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Rabu"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          Text(
                            'Kamis',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Kamis"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          Text(
                            'Jumat',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Jumat"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          Text(
                            'Sabtu',
                            style: kHeading5,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Sabtu"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Minggu',
                            style: kHeading5,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPelanggan?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPelanggan![index].hari ==
                                      "Minggu"
                                  ?
                                  // Text('data');
                                  CardJadwalPelangganHari(
                                      // hari:
                                      //     controller.listJadwalPelanggan?[index].hari ??
                                      //         "Hari",
                                      nama: controller
                                              .listJadwalPelanggan?[index]
                                              .pelanggan
                                              ?.nama_pelanggan ??
                                          "Nama",
                                      desa: controller
                                              .listJadwalPelanggan?[index]
                                              .desa
                                              ?.nama_desa ??
                                          "Desa")
                                  : Text('Salah Hari');
                            },
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
