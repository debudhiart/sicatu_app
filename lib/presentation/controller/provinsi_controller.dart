import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/Provinsi.dart';

import '../service/provinsi_service.dart';

class ProvinsiController extends GetxController {
  List<Provinsi>? listProvinsi;
  RxBool isLoading = false.obs;

  final service = Get.put(ProvinsiService());

  void onInit() async {
    super.onInit();
    await getProvinsi();
    print(listProvinsi);
  }

  Future<List<Provinsi>?> getProvinsi() async {
    isLoading.value = true;
    listProvinsi = await service.getProvinsiService();
    isLoading.value = false;
    return listProvinsi;
  }
}
