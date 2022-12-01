import 'package:get/get.dart';
// import 'package:sicatu_app/data/datasources/models/Kecamatan.dart';

import '../../data/datasources/models/keluhan.dart';

import '../service/keluhan_service.dart';

class KeluhanController extends GetxController {
  List<Keluhan>? listKeluhan;
  RxBool isLoading = false.obs;

  final service = Get.put(KeluhanService());

  void onInit() async {
    super.onInit();
    await getKeluhan();
    print(listKeluhan);
  }

  Future<List<Keluhan>?> getKeluhan() async {
    isLoading.value = true;
    listKeluhan = await service.getKeluhanService();
    isLoading.value = false;
    return listKeluhan;
  }
}
