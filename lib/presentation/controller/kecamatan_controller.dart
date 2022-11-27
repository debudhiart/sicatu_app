import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/Kecamatan.dart';

import '../service/kecamatan_service.dart';

class KecamatanController extends GetxController {
  List<Kecamatan>? listKecamatan;
  RxBool isLoading = false.obs;

  final service = Get.put(KecamatanService());

  void onInit() async {
    super.onInit();
    await getKecamatan();
    print(listKecamatan);
  }

  Future<List<Kecamatan>?> getKecamatan() async {
    isLoading.value = true;
    listKecamatan = await service.getKecamatanService();
    isLoading.value = false;
    return listKecamatan;
  }
}
