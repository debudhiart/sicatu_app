import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/constants.dart';
import '../controller/user_detail_controller.dart';
import '../controller/users_controller.dart';
import '../service/user_service.dart';

import '../widgets/navigation_drawer.dart';
import '../widgets/search_loading.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  // DashboardPage({required this});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String nama = '';
  int roles_id = 0;
  int users_id = 0;

  var _userDetailController = Get.put(UserDetailController());

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _pullRefresh() async {
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user') ?? '');

    if (user != null) {
      setState(() {
        nama = user['nama'];
        roles_id = user['roles_id'];
        users_id = user['users_id'];
        // // print(user['users_id']);
        WidgetsBinding.instance.addPostFrameCallback(
          (_) async {
            try {
              _userDetailController = Get.find<UserDetailController>();
            } catch (e) {
              _userDetailController = Get.put(UserDetailController());
            }
            await _userDetailController.getDetailUser(users_id);
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
        iconTheme: IconThemeData(color: biruColor),
        title: Text(
          'Dashboard',
          style: GoogleFonts.inter(
            color: hitamColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
          // GoogleFonts.inter()
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          color: biruColor,
          child: Obx(
            () => _userDetailController.isLoading.value
                ? Center(
                    child: SearchLoading(
                      title: 'Loading Get Data User',
                      subtitle: '',
                    ),
                    // CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 42.0, bottom: 42.0, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Welcome',
                            style: kHeading5,
                          ),
                          Text(
                            _userDetailController.detailUser?.nama ?? 'Nama',
                            // '$nama',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 42.0,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.05),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.person,
                                              color: abuAbuColor,
                                              size: 41,
                                            ),
                                            SizedBox(
                                              width: 21,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '142',
                                                    style: kHeading5,
                                                  ),
                                                  Text(
                                                    'Jumlah Pengguna',
                                                    style: kdescription,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4)),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.05),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  0), // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.engineering,
                                              color: abuAbuColor,
                                              size: 41,
                                            ),
                                            SizedBox(
                                              width: 21,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                  Text(
                                                    '142',
                                                    style: kHeading5,
                                                  ),
                                                  Text(
                                                    'Jumlah Petugas',
                                                    style: kdescription,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  if (roles_id == 1) {
                                    return Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.05),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            0), // changes position of shadow
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.villa,
                                                        color: abuAbuColor,
                                                        size: 41,
                                                      ),
                                                      SizedBox(
                                                        width: 21,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Text(
                                                              '142',
                                                              style: kHeading5,
                                                            ),
                                                            Text(
                                                              'Jumlah Data Desa',
                                                              style:
                                                                  kdescription,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.05),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: Offset(0,
                                                            0), // changes position of shadow
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.history_edu,
                                                        color: abuAbuColor,
                                                        size: 41,
                                                      ),
                                                      SizedBox(
                                                        width: 21,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Text(
                                                              '142',
                                                              style: kHeading5,
                                                            ),
                                                            Text(
                                                              'Jumlah Admin Desa',
                                                              style:
                                                                  kdescription,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Text(
                            'Ranking Desa',
                            style: kHeading5,
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: emasColor,
                                border: Border.all(
                                    width: 1,
                                    color: abuAbuColor.withOpacity(0.5)),
                                // border: Bpo,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(
                                          'Pecatu',
                                          style: ktittle,
                                        ),
                                        Text(
                                          'Jumlah Pendapatan: Rp. 100.000',
                                          style: kdescription,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 1',
                                    style: kHeading5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: silverColor,
                                border: Border.all(
                                  width: 1,
                                  color: abuAbuColor.withOpacity(0.5),
                                ),
                                // border: Bpo,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(
                                          'Pecatu',
                                          style: ktittle,
                                        ),
                                        Text(
                                          'Jumlah Pendapatan: Rp. 100.000',
                                          style: kdescription,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 2',
                                    style: kHeading5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: perungguColor,
                                border: Border.all(
                                  width: 1,
                                  color: abuAbuColor.withOpacity(0.5),
                                ),
                                // border: Bpo,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(
                                          'Pecatu',
                                          style: ktittle,
                                        ),
                                        Text(
                                          'Jumlah Pendapatan: Rp. 100.000',
                                          style: kdescription,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rank 3',
                                    style: kHeading5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
