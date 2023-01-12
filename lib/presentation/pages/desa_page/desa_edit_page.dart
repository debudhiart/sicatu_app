import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/desa.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';
import 'package:sicatu_app/presentation/controller/desa_controller.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_view_page.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';

class DesaEditPage extends StatefulWidget {
  // DesaEditPage({Key? key}) : super(key: key);
  Desa desa;

  DesaEditPage({required this.desa});

  @override
  State<DesaEditPage> createState() => _DesaEditPageState();
}

class _DesaEditPageState extends State<DesaEditPage> {
  List<Kecamatan>? kecamatan;
  var _desaDetailController = Get.put(DesaController());

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _desaDetailController = Get.find<DesaController>();
        } catch (e) {
          _desaDetailController = Get.put(DesaController());
        }
        kecamatan = await _desaDetailController.listKecamatan;
        _desaDetailController.namaDesaController.text = widget.desa.nama_desa;
        _desaDetailController.selectedIdKecamatan = widget.desa.kecamatan_id;
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Edit Profile Desa',
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
          Get.back();
        }),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 44.0, bottom: 16.0, right: 16.0, left: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  // Text(
                  //   'Provinsi',
                  //   style: TextStyle(color: abuAbuColor),
                  // ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // TextFormField(
                  //   // controller: _namaController,
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: abuAbuColor),
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
                  //     hintText: "ex: Bali",
                  //     hintStyle: TextStyle(
                  //       color: placeholderColor,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  //   style: kSubtitle,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Masukan Provinsi dengan benar";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  // Text(
                  //   'Kabupaten/Kota',
                  //   style: TextStyle(color: abuAbuColor),
                  // ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  // TextFormField(
                  //   // controller: _namaController,
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: abuAbuColor),
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
                  //     hintText: "ex: Badung",
                  //     hintStyle: TextStyle(
                  //       color: placeholderColor,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  //   style: kSubtitle,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Masukan Kabupaten/Kota dengan benar";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  // SizedBox(
                  //   height: 14,
                  // ),
                  Text(
                    'Nama Kecamatan',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  DropdownButtonFormField(
                    validator: (value) =>
                        value == null ? 'Pilih Kecamatan' : null,
                    isExpanded: true,
                    value: _desaDetailController.selectedIdKecamatan,
                    hint: Text("Pilih Desa"),
                    items: _desaDetailController.listKecamatan
                        ?.map(
                          (e) => DropdownMenuItem(
                            child: Text(e.nama_kecamatan),
                            value: e.kecamatan_id,
                          ),
                        )
                        .toList(),
                    onChanged: (e) {
                      setState(
                        () {
                          _desaDetailController.selectedIdKecamatan = e;
                        },
                      );
                    },
                  ),
                  // TextFormField(
                  //   // controller: _namaController,
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(width: 1, color: abuAbuColor),
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
                  //     hintText: "ex: Kuta Selatan",
                  //     hintStyle: TextStyle(
                  //       color: placeholderColor,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  //   style: kSubtitle,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Masukan Nama Kecamatan dengan benar";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Nama Desa',
                    style: TextStyle(color: abuAbuColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: _desaDetailController.namaDesaController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: abuAbuColor),
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
                        return "Masukan Nama Desa dengan benar";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 104,
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
                          _desaDetailController
                              .editDesa(widget.desa.desa_id)
                              .then(
                            (value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DesaViewPage();
                                  },
                                ),
                              );
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
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: biruColor,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
