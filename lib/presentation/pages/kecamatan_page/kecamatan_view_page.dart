import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/kecamatan_page/kecamatan_create_page.dart';
import 'package:sicatu_app/presentation/pages/kecamatan_page/kecamatan_detail_page.dart';

import '../../../common/constants.dart';
import '../../controller/kecamatan_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/kecamatan_service.dart';
import '../../widgets/search_loading.dart';

class KecamatanViewPage extends StatefulWidget {
  @override
  State<KecamatanViewPage> createState() => _KecamatanViewPageState();
}

class _KecamatanViewPageState extends State<KecamatanViewPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // const KecamatanViewPage({Key? key}) : super(key: key);
  final controller = Get.put(KecamatanController());

  Future<void> _pullRefresh() async {
    controller.getKecamatan();
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
      floatingActionButton: Container(
        child: LayoutBuilder(
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
                        return KecamatanCreatePage();
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
