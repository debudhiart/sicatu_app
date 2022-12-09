import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_petugas_page/jadwal_petugas_create_page.dart';
import 'package:sicatu_app/presentation/pages/jadwal_petugas_page/jadwal_petugas_detail_page.dart';
import 'package:sicatu_app/presentation/widgets/card_jadwal_petugas_hari.dart';

import '../../../common/constants.dart';
import '../../controller/jadwal_petugas_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/jadwal_petugas_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';
// import '../widgets/navigation_drawer.dart';

class JadwalPetugasViewPage extends StatefulWidget {
  @override
  State<JadwalPetugasViewPage> createState() => _JadwalPetugasViewPageState();
}

class _JadwalPetugasViewPageState extends State<JadwalPetugasViewPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // const JadwalPetugasViewPage({Key? key}) : super(key: key);
  final controller = Get.put(JadwalPetugasController());

  Future<void> _pullRefresh() async {
    controller.getJadwalPetugas();
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
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jadwal Petugas',
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
      floatingActionButton: Container(
        child: LayoutBuilder(builder: (context, constraints) {
          if (roles_id == 1 || roles_id == 2) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: biruColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return JadwalPetugasCreatePage();
                    },
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        }),
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
                        title: 'Loading Get Data Jadwal Petugas',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Senin',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Senin"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
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
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Selasa"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
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
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Rabu"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
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
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Kamis"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
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
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Jumat"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Sabtu',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Sabtu"
                                  ?
                                  // Text('data');
                                  Column(
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Minggu',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.listJadwalPetugas?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return controller
                                          .listJadwalPetugas![index].hari ==
                                      "Minggu"
                                  ?
                                  // Text('data');
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CardJadwalPetugasHari(
                                            // hari:
                                            //     controller.listJadwalPetugas?[index].hari ??
                                            //         "Hari",
                                            id: controller
                                                .listJadwalPetugas![index]
                                                .jadwal_petugas_id,
                                            nama: controller
                                                    .listJadwalPetugas?[index]
                                                    .petugas
                                                    ?.nama_petugas ??
                                                "Nama",
                                            desa: controller
                                                    .listJadwalPetugas?[index]
                                                    .desa
                                                    ?.nama_desa ??
                                                "Desa"),
                                      ],
                                    )
                                  : SizedBox();
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
