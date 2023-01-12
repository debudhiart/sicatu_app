import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/User.dart';
import 'package:sicatu_app/data/datasources/models/detail_user.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_view_page.dart';

import '../../../common/constants.dart';
import '../../../data/datasources/models/desa.dart';
import '../../controller/user_detail_controller.dart';
import '../../controller/users_controller.dart';
// import '../../common/constants.dart';

class UserEditProfilePage extends StatefulWidget {
  // UserEditProfilePage({Key? key}) : super(key: key);

  UserDetail users;

  UserEditProfilePage({required this.users});

  @override
  State<UserEditProfilePage> createState() => _UserEditProfilePageState();
}

class _UserEditProfilePageState extends State<UserEditProfilePage> {
  List<Desa>? desa;

  var _userDetailController = Get.put(UserDetailController());

  var _userController = Get.put(UserController());
  // UserDetail? user;

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
        _userDetailController.namaController.text = widget.users.nama;
        _userDetailController.alamatController.text = widget.users.address;
        // _userDetailController.desaController.text =
        //     widget.users.desa_id.toString();
        _userDetailController.selectedIdDesa = widget.users.desa_id;
        _userDetailController.emailController.text = widget.users.email;
        _userDetailController.roleController.text =
            widget.users.roles_id.toString();
        if (widget.users.pelanggan?.hp != null) {
          _userDetailController.nomorhandphoneController.text =
              widget.users.pelanggan?.hp ?? "No hp";
        } else if (widget.users.operator?.hp != null) {
          _userDetailController.nomorhandphoneController.text =
              widget.users.operator?.hp ?? "No hp";
        } else if (widget.users.petugas?.hp != null) {
          _userDetailController.nomorhandphoneController.text =
              widget.users.petugas?.hp ?? "No hp";
        }
      },
    );

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile User',
          style: GoogleFonts.inter(
            color: hitamColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(onPressed: () {
          Get.back();
          _userDetailController.resetForm();
        }),
        iconTheme: IconThemeData(color: biruColor),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                    children: <Widget>[
                      Text(
                        'Nama',
                        style: TextStyle(color: abuAbuColor),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Nama dengan benar";
                          }
                          return null;
                        },
                        controller: _userDetailController.namaController,

                        // cursorColor: softBlueColor,
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
                        // controller: fullNameController,
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
                        value: _userDetailController.selectedIdDesa,
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
                              _userDetailController.selectedIdDesa = e;
                            },
                          );
                        },
                      ),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Masukan Nama Desa dengan benar";
                      //     }
                      //     return null;
                      //   },
                      //   controller: _userDetailController.desaController,

                      //   // cursorColor: softBlueColor,
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
                      //   // controller: fullNameController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Email dengan benar";
                          } else if (!value.contains('@')) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                        controller: _userDetailController.emailController,

                        keyboardType: TextInputType.emailAddress,
                        // cursorColor: softBlueColor,
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
                        // controller: fullNameController,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Masukan Alamat dengan benar";
                          }
                          return null;
                        },
                        controller: _userDetailController.alamatController,

                        // cursorColor: softBlueColor,
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
                        style: kSubtitle,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        maxLines: 6,
                        // controller: fullNameController,
                      ),
                      // SizedBox(
                      //   height: 14,
                      // ),
                      // Text(
                      //   'Role',
                      //   style: TextStyle(color: abuAbuColor),
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "Masukan Role dengan benar";
                      //     }
                      //     return null;
                      //   },
                      //   controller: _userDetailController.roleController,
                      //   // cursorColor: softBlueColor,
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
                      //     hintText: "ex: User",
                      //     hintStyle: TextStyle(
                      //       color: placeholderColor,
                      //       fontWeight: FontWeight.w500,
                      //     ),
                      //   ),
                      //   style: kSubtitle,
                      //   keyboardType: TextInputType.multiline,
                      //   // controller: fullNameController,
                      // ),
                      LayoutBuilder(builder: (context, constraints) {
                        if (widget.users.users_id != 1) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Masukan Nomor Handphone dengan benar";
                                  } else if (value.length < 11) {
                                    return "Nomor Handphone harus lebih dari 11 karakter";
                                  }
                                  return null;
                                },
                                controller: _userDetailController
                                    .nomorhandphoneController,
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
                                  hintText: "ex: 085632563254",
                                  hintStyle: TextStyle(
                                    color: placeholderColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: kSubtitle,
                                keyboardType: TextInputType.number,

                                // controller: fullNameController,
                              ),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      }),
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
                              _userDetailController
                                  .editUser(widget.users.users_id)
                                  .then(
                                (value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return UserViewPage();
                                      },
                                    ),
                                  );
                                  _userDetailController.resetForm();

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
                          },
                          child: Text("Save"),
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
                            _userDetailController.resetForm();
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
    );
  }
}
