import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/provinsi.dart';

import '../service/provinsi_service.dart';

class ProvinsiController extends GetxController {
  List<Provinsi>? listProvinsi;
  Provinsi? detailProvinsi;
  RxBool isLoading = false.obs;

  final service = Get.put(ProvinsiService());

  void onInit() async {
    super.onInit();
    await getProvinsi();
    // await getDetailProvinsi(id);
    print(listProvinsi);
  }

  Future<List<Provinsi>?> getProvinsi() async {
    isLoading.value = true;
    listProvinsi = await service.getProvinsiService();
    isLoading.value = false;
    return listProvinsi;
  }

  Future<Provinsi?> getDetailProvinsi(int id) async {
    isLoading.value = true;
    detailProvinsi = await service.getDetailProvinsiService(id);
    isLoading.value = false;
    print(detailProvinsi);
    return detailProvinsi;
  }

  Future<Provinsi?> deleteProvinsi(int id) async {
    isLoading.value = true;
    await service.deleteDataProvinsiService(id);
    isLoading.value = false;
  }
}
