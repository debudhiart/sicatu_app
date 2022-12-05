import 'package:get/get.dart';
// import 'package:sicatu_app/data/datasources/models/Keluhan.dart';

import '../../data/datasources/models/keluhan.dart';

import '../service/keluhan_service.dart';

class KeluhanController extends GetxController {
  Keluhan? detailKeluhan;
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

  Future<Keluhan?> getDetailKeluhan(int id) async {
    isLoading.value = true;
    detailKeluhan = await service.getDetailKeluhanService(id);
    isLoading.value = false;
    print(detailKeluhan);
    return detailKeluhan;
  }
}
