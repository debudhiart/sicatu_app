import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/shift_page/shift_edit_page.dart';
// import 'package:sicatu_app/presentation/pages/shift_edit_page.dart';

import '../../../common/constants.dart';
import '../../controller/shift_controller.dart';
import '../../service/shift_service.dart';
import '../../widgets/search_loading.dart';
// import '../../common/constants.dart';

class ShiftDetailPage extends StatefulWidget {
  // const ShiftDetailPage({Key? key}) : super(key: key);
  var shift_id;
  ShiftDetailPage({required this.shift_id});

  @override
  State<ShiftDetailPage> createState() => _ShiftDetailPageState();
}

class _ShiftDetailPageState extends State<ShiftDetailPage> {
  var _shiftDetailController = Get.put(ShiftController());

  final _shiftService = Get.put(ShiftService());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        try {
          _shiftDetailController = Get.find<ShiftController>();
        } catch (e) {
          _shiftDetailController = Get.put(ShiftController());
        }
        await _shiftDetailController.getDetailShift(widget.shift_id);
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Detail Shift',
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 54,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: merahColor,
              minimumSize: Size(318, 44),
            ),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    'Hapus Shift',
                    style: kalerttittle,
                  ),
                  content: Text(
                    'Yakin ingin hapus shift ini?',
                    style: kdescription14hitam,
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'Hapus');
                      },
                      child: Text(
                        'Hapus',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Delete Shift",
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() => _shiftDetailController.isLoading.value
            ? Center(
                child: SearchLoading(
                  title: 'Loading Get Data Detail ',
                  subtitle: '',
                ),
                // CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Stack(
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
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 108,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    _shiftDetailController.detailShift?.shift ??
                                        'Ya',
                                    style: kHeading5Putih,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return ShiftEditPage();
                                          },
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              )),
      ),
    );
  }
}
