import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/user_view_page.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/Role.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_view_page.dart';

import '../../../common/constants.dart';
import '../../../data/datasources/models/desa.dart';
import '../../controller/user_detail_controller.dart';
import '../../controller/users_controller.dart';
// import '../../common/constants.dart';

class UserCreatePage extends StatefulWidget {
  @override
  State<UserCreatePage> createState() => _UserCreatePageState();
}

class _UserCreatePageState extends State<UserCreatePage> {
  // UserCreatePage({Key? key}) : super(key: key);
  int roles_id = 0;
  List<Desa>? desa;

  var _userController = Get.put(UserController());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _userController = Get.find<UserController>();
        } catch (e) {
          _userController = Get.put(UserController());
        }
        desa = await _userController.listDesa;
      },
    );
    super.initState();
  }

  // final _idUserTest = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Profile User',
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
        leading: BackButton(onPressed: () {
          _userController.resetForm();
          Get.back();
        }),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 41,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      print('Test Gesture Ganti Foto');
                    },
                    child: CircleAvatar(
                      child: CircleAvatar(
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: placeholderColor,
                        ),
                        radius: 72,
                        backgroundColor: softBlueColor,
                      ),
                      radius: 75,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Nama',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _userController.namaController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            // borderSide: BorderSide.none,
                          ),
                          fillColor: softBlueColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: "ex: Budhi Arta",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Nama dengan benar";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Desa',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField(
                        validator: (value) =>
                            value == null ? 'Pilih Kecamatan' : null,
                        isExpanded: true,
                        value: _userController.selectedIdDesa,
                        hint: Text("Pilih Desa"),
                        items: _userController.listDesa
                            ?.map(
                              (e) => DropdownMenuItem(
                                child: Text(e.nama_desa),
                                value: e.desa_id,
                              ),
                            )
                            .toList(),
                        onChanged: (e) {
                          setState(
                            () {
                              _userController.selectedIdDesa = e;
                            },
                          );
                        },
                      ),

                      // TextFormField(
                      //   // controller: _userController.desaController,
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide:
                      //           BorderSide(width: 1, color: abuAbuColor),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(4),
                      //       // borderSide: BorderSide.none,
                      //     ),
                      //     fillColor: softBlueColor,
                      //     filled: true,
                      //     contentPadding: EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 12,
                      //     ),
                      //     hintText: "ex: Pecatu",
                      //     hintStyle: TextStyle(
                      //       color: placeholderColor,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      //   style: kSubtitle,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Masukan Data Desa dengan benar";
                      //     }
                      //     return null;
                      //   },
                      // ),

                      // Field Jabatan

                      // LayoutBuilder(
                      //   builder: (context, constraints) {
                      //     if (_idUserTest == 2 || _idUserTest == 3) {
                      //       return Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisSize: MainAxisSize.max,
                      //         children: <Widget>[
                      //           SizedBox(
                      //             height: 14,
                      //           ),
                      //           Text(
                      //             'Jabatan',
                      //             style: TextStyle(color: abuAbuColor),
                      //           ),
                      //           SizedBox(
                      //             height: 8,
                      //           ),
                      //           TextFormField(
                      //             validator: (value) {
                      //               if (value == null || value.isEmpty) {
                      //                 return "Masukan Nomor Handphone dengan benar";
                      //               }
                      //               return null;
                      //             },
                      //             // cursorColor: softBlueColor,
                      //             decoration: InputDecoration(
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                     width: 1, color: abuAbuColor),
                      //               ),
                      //               border: OutlineInputBorder(
                      //                 borderRadius: BorderRadius.circular(4),
                      //                 // borderSide: BorderSide.none,
                      //               ),
                      //               fillColor: softBlueColor,
                      //               filled: true,
                      //               contentPadding: EdgeInsets.symmetric(
                      //                 horizontal: 16,
                      //                 vertical: 12,
                      //               ),
                      //               hintText: "ex: Kepala Desa",
                      //               hintStyle: TextStyle(
                      //                 color: placeholderColor,
                      //                 fontWeight: FontWeight.w500,
                      //               ),
                      //             ),
                      //             style: kSubtitle,
                      //             keyboardType: TextInputType.number,

                      //             // controller: fullNameController,
                      //           ),
                      //           SizedBox(

                      //           ),
                      //         ],
                      //       );
                      //     } else {
                      //       return SizedBox(

                      //       );
                      //     }
                      //   },
                      // ),
                      SizedBox(
                        height: 14,
                      ),

                      Text(
                        'Email',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userController.emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            // borderSide: BorderSide.none,
                          ),
                          fillColor: softBlueColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: "ex: nama@instansi.com",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Email dengan benar";
                          } else if (!value.contains('@')) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Alamat',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _userController.alamatController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            // borderSide: BorderSide.none,
                          ),
                          fillColor: softBlueColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: "ex: Jalan Veteran kebangsaan",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        minLines: 4,
                        maxLines: 6,
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Alamat dengan benar";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Role',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField(
                        validator: (value) =>
                            value == null ? 'Pilih Kecamatan' : null,
                        isExpanded: true,
                        value: _userController.selectedIdRole,
                        hint: Text("Pilih Role"),
                        items: DummyRole.map(
                          (e) => DropdownMenuItem(
                            child: Text(e.nama_role),
                            value: e.roles_id,
                          ),
                        ).toList(),
                        onChanged: (e) {
                          setState(
                            () {
                              _userController.selectedIdRole = e;
                            },
                          );
                        },
                      ),
                      // TextFormField(
                      //   controller: _userController.roleController,
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide:
                      //           BorderSide(width: 1, color: abuAbuColor),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(4),
                      //       // borderSide: BorderSide.none,
                      //     ),
                      //     fillColor: softBlueColor,
                      //     filled: true,
                      //     contentPadding: EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 12,
                      //     ),
                      //     hintText: "ex: Role",
                      //     hintStyle: TextStyle(
                      //       color: placeholderColor,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      //   style: kSubtitle,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Masukan Role dengan benar";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      // SizedBox(
                      //   height: 14,
                      // ),
                      // Text(
                      //   'Nomor Handphone',
                      //   style: TextStyle(color: abuAbuColor),
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // TextFormField(
                      //   keyboardType: TextInputType.number,
                      //   controller: _userController.nomorhandphoneController,
                      //   decoration: InputDecoration(
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide:
                      //           BorderSide(width: 1, color: abuAbuColor),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(4),
                      //       // borderSide: BorderSide.none,
                      //     ),
                      //     fillColor: softBlueColor,
                      //     filled: true,
                      //     contentPadding: EdgeInsets.symmetric(
                      //       horizontal: 16,
                      //       vertical: 12,
                      //     ),
                      //     hintText: "ex: 085536553596",
                      //     hintStyle: TextStyle(
                      //       color: placeholderColor,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      //   style: kSubtitle,
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Masukan Nomor Handphone dengan benar";
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _userController.passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            // borderSide: BorderSide.none,
                          ),
                          fillColor: softBlueColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: "ex: Password",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Password dengan benar";
                          } else if (value.length < 8) {
                            return "Password harus lebih dari 8 karakter";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Password Confirmed',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _userController.passwordConfirmedController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: abuAbuColor),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            // borderSide: BorderSide.none,
                          ),
                          fillColor: softBlueColor,
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          hintText: "ex: Password",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Password dengan benar";
                          } else if (value.length < 8) {
                            return "Password harus lebih dari 8 karakter";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
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
                            if (_formKey.currentState!.validate()) {
                              _userController.createUser().then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return UserViewPage();
                                      },
                                    ),
                                  );
                                  _userController.resetForm();

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) {
                                  //       return DashBoardPage();
                                  //     },
                                  //   ),
                                  // );
                                },
                              );
                            } else {}
                            print(_userController.namaController.text);
                          },
                          child: Text('Save'),
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
                            Get.back();
                            _userController.resetForm();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: biruColor,
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
      // body:
    );
  }
}
