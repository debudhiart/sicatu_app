import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sicatu_app/presentation/pages/user_view_page.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/presentation/pages/user_page/user_view_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class UserCreatePage extends StatelessWidget {
  UserCreatePage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _idUserTest = 1;

  TextEditingController _namaController = TextEditingController();
  TextEditingController _desaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
  TextEditingController _nomorhandphoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future saveNewUser() async {
    final response = await http
        .post(Uri.parse('http://192.168.106.1:8000/api/user/store'), body: {
      // "roles_id": _roleController,
      // "desa_id": _desaController,
      "nama": _namaController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "address": _alamatController.text,
    });

    print(response.body);
    return json.decode(response.body);
  }

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
                        controller: _namaController,
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
                      TextFormField(
                        controller: _desaController,
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
                          hintText: "ex: Pecatu",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Data Desa dengan benar";
                          }
                          return null;
                        },
                      ),

                      // Field Jabatan

                      Container(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            if (_idUserTest == 2 || _idUserTest == 3) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    'Jabatan',
                                    style: TextStyle(color: abuAbuColor),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Masukan Nomor Handphone dengan benar";
                                      }
                                      return null;
                                    },
                                    // cursorColor: softBlueColor,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: abuAbuColor),
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
                                      hintText: "ex: Kepala Desa",
                                      hintStyle: TextStyle(
                                        color: placeholderColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    style: kSubtitle,
                                    keyboardType: TextInputType.number,

                                    // controller: fullNameController,
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox(
                                height: 14,
                              );
                            }
                          },
                        ),
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
                        controller: _emailController,
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
                          hintText: "ex: debudhiart@gmail.com",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Email dengan benar";
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
                        controller: _alamatController,
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
                      TextFormField(
                        controller: _roleController,
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
                          hintText: "ex: Role",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Role dengan benar";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Nomor Handphone',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _nomorhandphoneController,
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
                          hintText: "ex: 085536553596",
                          hintStyle: TextStyle(
                            color: placeholderColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: kSubtitle,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Nomor Handphone dengan benar";
                          }
                          return null;
                        },
                      ),
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
                        controller: _passwordController,
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
                              saveNewUser().then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return UserViewPage();
                                      },
                                    ),
                                  );

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
                            print(_namaController.text);
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
                          onPressed: () {},
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
