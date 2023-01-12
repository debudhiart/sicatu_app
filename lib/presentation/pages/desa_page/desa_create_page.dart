import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/data/datasources/models/kabupaten_kota.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';
import 'package:sicatu_app/data/datasources/models/provinsi.dart';
import 'package:sicatu_app/presentation/pages/desa_page/desa_view_page.dart';

import '../../../common/constants.dart';
import '../../controller/desa_controller.dart';
// import '../../common/constants.dart';

class DesaCreatePage extends StatefulWidget {
  DesaCreatePage({Key? key}) : super(key: key);

  @override
  State<DesaCreatePage> createState() => _DesaCreatePageState();
}

class _DesaCreatePageState extends State<DesaCreatePage> {
  // List<Provinsi>? provinsi;
  // List<KabupatenKota>? kabupatenKota;
  List<Kecamatan>? kecamatan;

  var _desaController = Get.put(DesaController());

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _desaController = Get.find<DesaController>();
        } catch (e) {
          _desaController = Get.put(DesaController());
        }
        // provinsi = await _desaController.listProvinsi;
        // kabupatenKota = await _desaController.listKabupatenKota;
        kecamatan = await _desaController.listKecamatan;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Desa',
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
          _desaController.resetForm();
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
                  // DropdownButtonFormField(
                  //   validator: (value) =>
                  //       value == null ? 'Pilih Provinsi' : null,
                  //   isExpanded: true,
                  //   value: _desaController.selectedIdProvinsi,
                  //   hint: Text("Pilih Provinsi"),
                  //   items: _desaController.listProvinsi
                  //       ?.map(
                  //         (e) => DropdownMenuItem(
                  //           child: Text(e.nama_provinsi),
                  //           value: e.provinsi_id,
                  //         ),
                  //       )
                  //       .toList(),
                  //   onChanged: (e) {
                  //     setState(
                  //       () {
                  //         _desaController.selectedIdProvinsi = e;
                  //       },
                  //     );
                  //   },
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
                  // DropdownButtonFormField(
                  //   validator: (value) =>
                  //       value == null ? 'Pilih Kabupaten/Kota' : null,
                  //   isExpanded: true,
                  //   value: _desaController.selectedIdKabupatenKota,
                  //   hint: Text("Pilih Kabupaten/Kota"),
                  //   items: _desaController.listKabupatenKota
                  //       ?.map(
                  //         (e) => DropdownMenuItem(
                  //           child: Text(e.nama_kabupaten_kota),
                  //           value: e.kabupaten_kota_id,
                  //         ),
                  //       )
                  //       .toList(),
                  //   onChanged: (e) {
                  //     setState(
                  //       () {
                  //         _desaController.selectedIdKabupatenKota = e;
                  //       },
                  //     );
                  //   },
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
                    value: _desaController.selectedIdKecamatan,
                    hint: Text("Pilih Kecamatan"),
                    items: _desaController.listKecamatan
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
                          _desaController.selectedIdKecamatan = e;
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
                    controller: _desaController.namaDesaController,
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
                          _desaController.createDesa().then(
                            (value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DesaViewPage();
                                  },
                                ),
                              );
                              _desaController.resetForm();
                            },
                          );
                          // print('Berhasil Edit');
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
                        _desaController.resetForm();
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
