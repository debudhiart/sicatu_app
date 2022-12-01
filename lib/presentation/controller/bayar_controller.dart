import 'package:get/get.dart';
// import 'package:sicatu_app/data/datasources/models/Kecamatan.dart';

import '../../data/datasources/models/bayar.dart';

import '../service/bayar_service.dart';

class BayarController extends GetxController {
  List<Bayar>? listBayar;
  RxBool isLoading = false.obs;

  final service = Get.put(BayarService());

  void onInit() async {
    super.onInit();
    await getBayar();
    print(listBayar);
  }

  Future<List<Bayar>?> getBayar() async {
    isLoading.value = true;
    listBayar = await service.getBayarService();
    isLoading.value = false;
    return listBayar;
  }
}
