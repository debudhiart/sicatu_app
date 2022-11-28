import 'package:get/get.dart';
// import 'package:sicatu_app/data/datasources/models/Kecamatan.dart';

import '../../data/datasources/models/jabatan.dart';

import '../service/jabatan_service.dart';

class JabatanController extends GetxController {
  List<Jabatan>? listJabatan;
  RxBool isLoading = false.obs;

  final service = Get.put(JabatanService());

  void onInit() async {
    super.onInit();
    await getJabatan();
    print(listJabatan);
  }

  Future<List<Jabatan>?> getJabatan() async {
    isLoading.value = true;
    listJabatan = await service.getJabatanService();
    isLoading.value = false;
    return listJabatan;
  }
}
