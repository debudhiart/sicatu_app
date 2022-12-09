import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_view_page.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota_page/kabupaten_kota_view_page.dart';
import 'package:sicatu_app/presentation/pages/kecamatan_page/kecamatan_view_page.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_view_page.dart';

import '../../common/constants.dart';
import '../controller/desa_controller.dart';
import '../controller/user_detail_controller.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/search_loading.dart';
import '../widgets/wilayah_list_card.dart';

class WilayahPage extends StatefulWidget {
  const WilayahPage({Key? key}) : super(key: key);

  @override
  State<WilayahPage> createState() => _WilayahPageState();
}

class _WilayahPageState extends State<WilayahPage> {
  // String nama = '';
  int users_id = 0;
  int roles_id = 0;
  int desa_id = 0;

  var _desaDetailController = Get.put(DesaController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      setState(() {
        users_id = user['users_id'];
        roles_id = user['roles_id'];
        desa_id = user['desa_id'];
        // // print(user['users_id']);
        WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
            try {
              _desaDetailController = Get.find<DesaController>();
            } catch (e) {
              _desaDetailController = Get.put(DesaController());
            }
            await _desaDetailController.getDetailDesa(desa_id);
          },
        );
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
          'Wilayah',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (roles_id == 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DesaViewPage();
                              },
                            ),
                          );
                        },
                        child: WilayahListCard(
                          icon: Icons.villa,
                          title: "Desa",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return KecamatanViewPage();
                              },
                            ),
                          );
                        },
                        child: WilayahListCard(
                          icon: Icons.business_outlined,
                          title: "Kecamatan",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return KabupatenKotaViewPage();
                              },
                            ),
                          );
                        },
                        child: WilayahListCard(
                          icon: Icons.house_siding_outlined,
                          title: "Kabupaten dan Kota",
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProvinsiViewPage();
                              },
                            ),
                          );
                        },
                        child: WilayahListCard(
                          icon: Icons.water_damage_outlined,
                          title: "Provinsi",
                        ),
                      ),
                    ],
                  );
                } else {
                  return Obx(
                    () => _desaDetailController.isLoading.value
                        ? Center(
                            child: SearchLoading(
                              title: 'Loading Get Data Desa',
                              subtitle: '',
                            ),
                            // CircularProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _desaDetailController.detailDesa?.nama_desa ??
                                    "Desa",
                              ),
                              Text(
                                _desaDetailController.detailDesa?.kecamatan
                                        ?.nama_kecamatan ??
                                    "Kecamatan",
                              ),
                              Text(
                                _desaDetailController.detailDesa?.kecamatan
                                        ?.kabupaten_kota?.nama_kabupaten_kota ??
                                    "Kabupaten Kota",
                              ),
                              Text(
                                _desaDetailController
                                        .detailDesa
                                        ?.kecamatan
                                        ?.kabupaten_kota
                                        ?.provinsi
                                        ?.nama_provinsi ??
                                    "Provinsi",
                              ),
                            ],
                          ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
