import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/jenis_langganan_page/jenis_langganan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jenis_langganan_page/jenis_langganan_detail_page.dart';
// import 'package:sicatu_app/presentation/pages/jenis_langganan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jenis_langganan_detail_page.dart';

import '../../../common/constants.dart';
import '../../controller/jenis_langganan_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/jenis_langganan_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';
// import '../widgets/navigation_drawer.dart';

class JenisLanggananViewPage extends StatefulWidget {
  @override
  State<JenisLanggananViewPage> createState() => _JenisLanggananViewPageState();
}

class _JenisLanggananViewPageState extends State<JenisLanggananViewPage> {
  // const JenisLanggananViewPage({Key? key}) : super(key: key);
  int roles_id = 0;

  final controller = Get.put(JenisLanggananController());

  Future<void> _pullRefresh() async {
    controller.getJenisLangganan();
  }

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
          'Jenis Langganan',
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
      floatingActionButton: LayoutBuilder(
        builder: (context, constraints) {
          if (roles_id == 1 || roles_id == 2) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: biruColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return JenisLanggananCreatePage();
                    },
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            color: biruColor,
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SearchLoading(
                        title: 'Loading Get Data Jenis Langganan',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.listJenisLangganan?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return JenisLanggananDetailPage(
                                    jenis_langganan_id: controller
                                        .listJenisLangganan![index]
                                        .jenis_langganan_id,
                                  );
                                },
                              ),
                            );
                          },
                          child: CardJenisLangganan(
                            nama_jenis_layanan: controller
                                    .listJenisLangganan?[index]
                                    .nama_jenis_langganan ??
                                "Jenis Langganan",
                            desa: controller.listJenisLangganan?[index].desa
                                    ?.nama_desa ??
                                "Desa",
                            harga: controller.listJenisLangganan![index].harga,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardJenisLangganan extends StatelessWidget {
  // const CardJenisLangganan({
  //   Key? key,
  // }) : super(key: key);

  String nama_jenis_layanan;
  String desa;
  int harga;

  CardJenisLangganan({
    required this.nama_jenis_layanan,
    required this.desa,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100,
          child: Card(
            color: softBlueColor,
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            nama_jenis_layanan,
                            style: ktittle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            desa,
                            style: kdescription,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Rp $harga',
                    style: kdescription,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3,
        ),
      ],
    );
  }
}
