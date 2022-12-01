import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_detail_page.dart';
import 'package:sicatu_app/presentation/pages/jabatan_page/jabatan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jabatan_page/jabatan_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../controller/jabatan_controller.dart';
import '../../service/jabatan_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../widgets/navigation_drawer.dart';

class JabatanViewPage extends StatelessWidget {
  // const JabatanViewPage({Key? key}) : super(key: key);
  final controller = Get.put(JabatanController());
  final service = Get.put(JabatanService());

  Future<void> _pullRefresh() async {
    controller.getJabatan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Jabatan',
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
                return JabatanCreatePage();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          color: biruColor,
          child: Obx(() => controller.isLoading.value
              ? Center(
                  child: SearchLoading(
                    title: 'Loading Get Data Jabatan',
                    subtitle: '',
                  ),
                  // CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: controller.listJabatan?.length,
                    // snapshot.data['data'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JabatanDetailPage(
                                  jabatan_id:
                                      controller.listJabatan![index].jabatan_id
                                  // users: snapshot.data['data'][index],
                                  ),
                            ),
                          );
                        },
                        child: CardJabatan(
                          nama_jabatan:
                              controller.listJabatan?[index].nama_jabatan ??
                                  "Nama Jabatan",
                          desa:
                              controller.listJabatan?[index].desa?.nama_desa ??
                                  "Nama Desa",
                        ),
                      );
                      // Text(snapshot.data['data'][index]['nama'])
                    },
                  ),
                )),
        ),
      ),
    );
  }
}

class CardJabatan extends StatelessWidget {
  // const CardJabatan({
  //   Key? key,
  // }) : super(key: key);

  String nama_jabatan;
  String desa;

  CardJabatan({
    required this.desa,
    required this.nama_jabatan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: Card(
        color: softBlueColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(nama_jabatan,
                      // snapshot.data['data'][index]['nama'],
                      style: ktittle),
                  // Text(
                  //   // snapshot.data['data'][index]['email'],
                  //   style: kdescriptionhitam,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    desa,
                    // snapshot.data['data'][index]['address'],
                    style: kdescription,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
