import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';

import '../service/kecamatan_service.dart';

class KecamatanController extends GetxController {
  Kecamatan? detailKecamatan;
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

  Future<Kecamatan?> getDetailKecamatan(int id) async {
    isLoading.value = true;
    detailKecamatan = await service.getDetailKecamatanService(id);
    isLoading.value = false;
    print(detailKecamatan);
    return detailKecamatan;
  }
}
