import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/jenis_langganan/jenis_langganan_create_page.dart';
import 'package:sicatu_app/presentation/pages/jenis_langganan/jenis_langganan_detail_page.dart';
// import 'package:sicatu_app/presentation/pages/jenis_langganan_create_page.dart';
// import 'package:sicatu_app/presentation/pages/jenis_langganan_detail_page.dart';

import '../../../common/constants.dart';
import '../../controller/jenis_langganan_controller.dart';
import '../../service/jenis_langganan_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';
// import '../widgets/navigation_drawer.dart';

class JenisLanggananViewPage extends StatelessWidget {
  // const JenisLanggananViewPage({Key? key}) : super(key: key);
  final controller = Get.put(JenisLanggananController());
  final service = Get.put(JenisLanggananService());

  Future<void> _pullRefresh() async {
    controller.getJenisLangganan();
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
      floatingActionButton: FloatingActionButton(
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: _pullRefresh,
            color: biruColor,
            child: Obx(() => controller.isLoading.value
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
                                return JenisLanggananDetailPage();
                              },
                            ),
                          );
                        },
                        child: CardJenisLangganan(
                          nama_jenis_layanan: controller
                                  .listJenisLangganan?[index]
                                  .nama_jenis_langganan ??
                              "Jenis Langganan",
                          desa: controller
                                  .listJenisLangganan?[index].desa?.nama_desa ??
                              "Desa",
                          harga: controller.listJenisLangganan![index].harga,
                        ),
                      );
                    },
                  )),
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
          height: 10,
        ),
      ],
    );
  }
}
