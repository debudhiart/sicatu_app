import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/common/constants.dart';
import 'package:sicatu_app/presentation/pages/dashboard_page.dart';
// import 'package:sicatu_app/presentation/pages/jabatan_view_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_pelanggan_view_page.dart';
// import 'package:sicatu_app/presentation/pages/jadwal_petugas_view_page.dart';
// import 'package:sicatu_app/presentation/pages/jenis_langganan_view_page.dart';
// import 'package:sicatu_app/presentation/pages/keluhan_view_page.dart';
// import 'package:sicatu_app/presentation/pages/pembayaran_view_page.dart';
import 'package:sicatu_app/presentation/pages/profile_page.dart';
// import 'package:sicatu_app/presentation/pages/shift_view_page.dart';
import 'package:sicatu_app/presentation/pages/template/template_page.dart';
import 'package:sicatu_app/presentation/pages/wilayah_page.dart';
// import 'package:sicatu_app/presentation/pages/user_view_page.dart';

// import '../pages/desa_view_page.dart';
import '../pages/desa_page/desa_view_page.dart';
import '../pages/jabatan_page/jabatan_view_page.dart';
import '../pages/jadwal_pelanggan_page/jadwal_pelanggan_view_page.dart';
import '../pages/jadwal_petugas_page/jadwal_petugas_view_page.dart';
import '../pages/jenis_langganan_page/jenis_langganan_view_page.dart';
import '../pages/keluhan_page/keluhan_view_page.dart';
import '../pages/pembayaran_page/pembayaran_view_page.dart';
import '../pages/shift_page/shift_view_page.dart';
import '../pages/user_page/user_view_page.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  String nama = '';
  int roles_id = 0;

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
        nama = user['nama'];
        roles_id = user['roles_id'];
        print(roles_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: biruColor,
              ),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.account_circle_outlined),
                backgroundColor: softBlueColor,
                // backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text(
                '$nama',
              ),
              accountEmail: Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (roles_id == 1) {
                      return Text("Super Admin");
                    } else if (roles_id == 2) {
                      return Text("Admin Desa");
                    } else if (roles_id == 3) {
                      return Text("Perangkat Desa");
                    } else if (roles_id == 4) {
                      return Text("Petugas");
                    } else if (roles_id == 5) {
                      return Text("Pelanggan");
                    } else {
                      return Text("");
                    }
                  },
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (roles_id == 1 ||
                    roles_id == 2 ||
                    roles_id == 3 ||
                    roles_id == 4 ||
                    roles_id == 5) {
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.dashboard),
                        title: Text('Dashboard'),
                        onTap: () {
                          // Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DashboardPage();
                              },
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.perm_identity),
                        title: Text('Profile'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage();
                              },
                            ),
                          );
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1 || roles_id == 2 || roles_id == 3) {
                            return ListTile(
                              leading: Icon(Icons.group),
                              title: Text('User'),
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return UserViewPage();
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
                      ListTile(
                        leading: Icon(Icons.map),
                        title: Text('Wilayah'),
                        onTap: () {
                          // Navigator.pop(context);
                          // Navigator.pushNamed(context, ListWatchlistPage.ROUTE_NAME);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WilayahPage();
                              },
                            ),
                          );
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1) {
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ShiftViewPage();
                                    },
                                  ),
                                );
                              },
                              leading: Icon(Icons.timelapse),
                              title: Text('Shift'),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1 || roles_id == 2) {
                            return ListTile(
                              onTap: () {
                                // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return JabatanViewPage();
                                    },
                                  ),
                                );
                              },
                              leading: Icon(Icons.assignment_ind),
                              title: Text('Jabatan'),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1 ||
                              roles_id == 2 ||
                              roles_id == 3 ||
                              roles_id == 4) {
                            return ListTile(
                              onTap: () {
                                // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return JadwalPelangganViewPage();
                                    },
                                  ),
                                );
                              },
                              leading: Icon(Icons.calendar_month),
                              title: Text('Jadwal Pelanggan'),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return JadwalPetugasViewPage();
                              },
                            ),
                          );
                        },
                        leading: Icon(Icons.calendar_today_outlined),
                        title: Text('Jadwal Petugas'),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1 || roles_id == 2 || roles_id == 3) {
                            return ListTile(
                              onTap: () {
                                // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return JenisLanggananViewPage();
                                    },
                                  ),
                                );
                              },
                              leading: Icon(Icons.book),
                              title: Text('Jenis Langganan'),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return KeluhanViewPage();
                              },
                            ),
                          );
                        },
                        leading: Icon(Icons.info_outline),
                        title: Text('Keluhan'),
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (roles_id == 1 ||
                              roles_id == 2 ||
                              roles_id == 3 ||
                              roles_id == 5) {
                            return ListTile(
                              onTap: () {
                                // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PembayaranViewPage();
                                    },
                                  ),
                                );
                              },
                              leading: Icon(Icons.monetization_on_sharp),
                              title: Text('Pembayaran'),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                      ListTile(
                        onTap: () {
                          // Navigator.pushNamed(context, AboutPage.ROUTE_NAME);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TemplatePage();
                              },
                            ),
                          );
                        },
                        leading: Icon(Icons.pages),
                        title: Text('Template'),
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
      ),
    );
  }
}
