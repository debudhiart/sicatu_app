import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/common/constants.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_create_page.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_detail_page.dart';
import 'package:sicatu_app/presentation/pages/pembayaran_page/pembayaran_create_page.dart';
import 'package:sicatu_app/presentation/pages/pembayaran_page/pembayaran_detail_page.dart';

// import '../../common/constants.dart';
import '../../controller/bayar_controller.dart';
import '../../controller/user_detail_controller.dart';
import '../../service/bayar_service.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_loading.dart';
// import '../widgets/navigation_drawer.dart';

class PembayaranViewPage extends StatefulWidget {
  @override
  State<PembayaranViewPage> createState() => _PembayaranViewPageState();
}

class _PembayaranViewPageState extends State<PembayaranViewPage> {
  int roles_id = 0;
  // int users_id = 0;
  // const PembayaranViewPage({Key? key}) : super(key: key);
  final controller = Get.put(BayarController());

  Future<void> _pullRefresh() async {
    controller.getBayar();
  }

  var _userDetailController = Get.put(UserDetailController());

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
          'Pembayaran',
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
            if (roles_id == 1 || roles_id == 2) {
              return FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: biruColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PembayaranCreatePage();
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
            child: Obx(() => controller.isLoading.value
                ? Center(
                    child: SearchLoading(
                      title: 'Loading Get Data Pembayaran',
                      subtitle: '',
                    ),
                    // CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.listBayar?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardPembayaran(
                        pembayaran_id: controller.listBayar![index].bayar_id,
                        nama: controller
                                .listBayar?[index].pelanggan?.nama_pelanggan ??
                            'Nama Pelanggan',
                        desa: controller.listBayar?[index].desa?.nama_desa ??
                            'Desa',
                        harga:
                            controller.listBayar?[index].nominal.toString() ??
                                "Nominal",
                      );
                    },
                  )),
          ),
        ),
      ),
    );
  }
}

class CardPembayaran extends StatelessWidget {
  // const CardPembayaran({
  //   Key? key,
  // }) : super(key: key);
  int pembayaran_id;
  String nama;
  String desa;
  String harga;

  CardPembayaran({
    required this.pembayaran_id,
    required this.nama,
    required this.desa,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return PembayaranDetailPage(
                    bayar_id: pembayaran_id,
                  );
                },
              ),
            );
          },
          child: Container(
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
                            Text(nama, style: ktittle),
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
                    Text(harga, style: kdescription),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }
}
