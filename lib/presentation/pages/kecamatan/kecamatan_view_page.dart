import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/kecamatan/kecamatan_create_page.dart';
import 'package:sicatu_app/presentation/pages/kecamatan/kecamatan_detail_page.dart';

import '../../../common/constants.dart';
import '../../controller/kecamatan_controller.dart';
import '../../service/kecamatan_service.dart';
import '../../widgets/search_loading.dart';

class KecamatanViewPage extends StatelessWidget {
  // const KecamatanViewPage({Key? key}) : super(key: key);

  final controller = Get.put(KecamatanController());
  final service = Get.put(KecamatanService());

  Future<void> _pullRefresh() async {
    controller.getKecamatan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Kecamatan',
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
                return KecamatanCreatePage();
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
                        title: 'Loading Get Data Kecamatan',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.listKecamatan?.length,
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
                                    builder: (context) => KecamatanDetailPage(
                                        kecamatan_id: controller
                                            .listKecamatan![index]
                                            .kecamatan_id),
                                  ),
                                );
                              },
                              child: CardKecamatan(
                                kecamatan: controller
                                        .listKecamatan?[index].nama_kecamatan ??
                                    "Kecamatan",
                              ),
                            ),
                          ],
                        );
                        // Text(snapshot.data['data'][index]['nama'])
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardKecamatan extends StatelessWidget {
  // const CardKecamatan({
  //   Key? key,
  // }) : super(key: key);

  String kecamatan;

  CardKecamatan({
    required this.kecamatan,
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
              Expanded(
                child: Text(
                  kecamatan,
                  style: ktittle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
