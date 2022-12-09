import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/change_password_page.dart';
import 'package:sicatu_app/presentation/pages/edit_profile_page.dart';
import 'package:sicatu_app/presentation/pages/login_page.dart';

import '../../common/constants.dart';
import '../../data/network/api.dart';
import '../controller/user_detail_controller.dart';
import '../controller/users_controller.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/search_loading.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
        roles_id = user['roles_id'];
        users_id = user['users_id'];
        // print(user['users_id']);
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
          'Profile',
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
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          color: biruColor,
          child: Obx(
            () => _userDetailController.isLoading.value
                ? Center(
                    child: SearchLoading(
                      title: 'Loading Get Data Profile',
                      subtitle: '',
                    ),
                    // CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 159,
                          decoration: BoxDecoration(
                            color: biruColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.05),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 68, left: 22),
                                    child: CircleAvatar(
                                      child: CircleAvatar(
                                        child:
                                            Icon(Icons.account_circle_outlined),
                                        radius: 72,
                                        backgroundColor: biruColor,
                                      ),
                                      radius: 75,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 16.0),
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return EditProfilePage();
                                              },
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 30,
                                          color: Colors.white,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 33,
                              ),
                              Text(
                                _userDetailController.detailUser?.nama ??
                                    "Nama",
                                style: kHeading5,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                _userDetailController
                                        .detailUser?.desa?.nama_desa ??
                                    "Desa",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                _userDetailController.detailUser?.email ??
                                    "Email",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                _userDetailController.detailUser?.address ??
                                    "Alamat",
                                style: kBodyText,
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Text(
                                _userDetailController
                                        .detailUser?.role?.nama_role ??
                                    "Role",
                                style: kBodyText,
                              ),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  if (roles_id == 5) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 9,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            // print('object');
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Lokasi Rumah",
                                                style: kBodyText,
                                              ),
                                              Icon(
                                                Icons.arrow_forward_outlined,
                                                color: biruColor,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                              SizedBox(
                                height: 122,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: biruColor,
                                    minimumSize: Size(318, 44),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return ChangePasswordPage();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text("Ganti Password"),
                                ),
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 54,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.transparent,
                                    minimumSize: Size(318, 44),
                                  ),
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: Text(
                                          'Logout',
                                          style: kalerttittle,
                                        ),
                                        content: Text(
                                          'Yakin ingin logout?',
                                          style: kdescription14hitam,
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              // Navigator.pop(context, 'Hapus');
                                              logout();
                                            },
                                            child: Text(
                                              'Logout',
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: merahColor),
                                            ),
                                          ),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: biruColor,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context, 'Kembali');
                                            },
                                            child: Text('Kembali'),
                                          )
                                          // TextButton(
                                          //   onPressed: () => Navigator.pop(context, 'Kembali'),
                                          //   child: Text('Kembali'),
                                          // ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: merahColor,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void logout() async {
    var res = await Network().postData('logout');
    var body = json.decode(res.body);
    print(res);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
