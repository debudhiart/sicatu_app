import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/controller/provinsi_controller.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_create_page.dart';
import 'package:sicatu_app/presentation/pages/provinsi_page/provinsi_detail_page.dart';
import 'package:sicatu_app/presentation/service/provinsi_service.dart';

import '../../../common/constants.dart';
import '../../controller/user_detail_controller.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';

class ProvinsiViewPage extends StatefulWidget {
  @override
  State<ProvinsiViewPage> createState() => _ProvinsiViewPageState();
}

class _ProvinsiViewPageState extends State<ProvinsiViewPage> {
  int roles_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // const ProvinsiViewPage({Key? key}) : super(key: key);
  final controller = Get.put(ProvinsiController());

  Future<void> _pullRefresh() async {
    controller.getProvinsi();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');
    await controller.getProvinsi();

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
          'Provinsi',
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
                      return ProvinsiCreatePage();
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
                        title: 'Loading Get Data Provinsi',
                        subtitle: '',
                      ),
                      // CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: controller.listProvinsi?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProvinsiDetailPage(
                                    provinsi_id: controller
                                        .listProvinsi![index].provinsi_id),
                              ),
                            );
                          },
                          child: CardProvinsi(
                            provinsi:
                                controller.listProvinsi?[index].nama_provinsi ??
                                    "Provinsi",
                          ),
                        );
                        // GridView.count(
                        //   physics: NeverScrollableScrollPhysics(),
                        //   shrinkWrap: true,
                        //   crossAxisCount: 2,
                        //   childAspectRatio: 3 / 2,
                        //   crossAxisSpacing: 12,
                        //   mainAxisSpacing: 10,
                        //   children: <Widget>[

                        //   ],
                        // );
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

class CardProvinsi extends StatelessWidget {
  // const CardProvinsi({
  //   Key? key,
  // }) : super(key: key);

  String provinsi;

  CardProvinsi({
    required this.provinsi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ClipRRect(
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
                  provinsi,
                  style: ktittle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
