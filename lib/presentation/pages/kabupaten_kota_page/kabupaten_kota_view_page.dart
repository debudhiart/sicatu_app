import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota_page/kabupaten_kota_create_page.dart';
import 'package:sicatu_app/presentation/pages/kabupaten_kota_page/kabupaten_kota_detail_page.dart';

import '../../../common/constants.dart';
import '../../controller/kabupaten_kota_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/kabupaten_kota_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';

class KabupatenKotaViewPage extends StatefulWidget {
  @override
  State<KabupatenKotaViewPage> createState() => _KabupatenKotaViewPageState();
}

class _KabupatenKotaViewPageState extends State<KabupatenKotaViewPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // const KabupatenKotaViewPage({Key? key}) : super(key: key);
  final controller = Get.put(KabupatenKotaController());

  Future<void> _pullRefresh() async {
    controller.getKabupatenKota();
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
      appBar: AppBar(
        title: Text(
          'Kabupaten/Kota',
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
          if (roles_id == 1) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: biruColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return KabupatenKotaCreatePage();
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
                        title: 'Loading Get Data Kabupaten Kota',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.listKabupatenKota?.length,
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
                                    builder: (context) =>
                                        KabupatenKotaDetailPage(
                                            kabupaten_kota_id: controller
                                                .listKabupatenKota![index]
                                                .kabupaten_kota_id),
                                  ),
                                );
                              },
                              child: CardKabupatenKota(
                                kabupatenKota: controller
                                        .listKabupatenKota?[index]
                                        .nama_kabupaten_kota ??
                                    "Nama Kabupaten",
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

class CardKabupatenKota extends StatelessWidget {
  // const CardKabupatenKota({
  //   Key? key,
  // }) : super(key: key);

  String kabupatenKota;

  CardKabupatenKota({
    required this.kabupatenKota,
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
                  kabupatenKota,
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
