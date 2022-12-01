import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/desa_create_page.dart';
// import 'package:sicatu_app/presentation/pages/desa_detail_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_create_page.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_detail_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../controller/desa_controller.dart';
import '../../service/desa_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../widgets/navigation_drawer.dart';

class DesaViewPage extends StatelessWidget {
  // const DesaViewPage({Key? key}) : super(key: key);

  final controller = Get.put(DesaController());
  final service = Get.put(DesaService());

  Future<void> _pullRefresh() async {
    controller.getDesa();
  }

  @override
  Widget build(BuildContext context) {
    // final int gridCount;

    return Scaffold(
      extendBodyBehindAppBar: true,
      // drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text(
          'Desa',
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
                return DesaCreatePage();
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
            child: Obx(
              () => controller.isLoading.value
                  ? Center(
                      child: SearchLoading(
                        title: 'Loading Get Data Kabupaten Kota',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.listDesa?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 10,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DesaDetailPage(
                                        desa_id: controller
                                            .listDesa![index].desa_id),
                                  ),
                                );
                              },
                              child: CardDesa(
                                  desa: controller.listDesa?[index].nama_desa ??
                                      "Nama Desa"),
                            ),
                          ],
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

class CardDesa extends StatelessWidget {
  // const CardDesa({
  //   Key? key,
  // }) : super(key: key);

  String desa;

  CardDesa({
    required this.desa,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Card(
        color: softBlueColor,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                desa,
                style: ktittle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
