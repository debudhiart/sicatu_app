import 'package:get/get.dart';

import '../../data/datasources/models/jabatan.dart';

import '../service/jabatan_service.dart';

class JabatanController extends GetxController {
  Jabatan? detailJabatan;
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

  Future<Jabatan?> getDetailJabatan(int id) async {
    isLoading.value = true;
    detailJabatan = await service.getDetailJabatanService(id);
    isLoading.value = false;
    print(detailJabatan);
    return detailJabatan;
  }
}
