import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/KabupatenKota.dart';
import 'package:sicatu_app/presentation/service/kabupaten_kota_service.dart';

class KabupatenKotaController extends GetxController {
  List<KabupatenKota>? listKabupatenKota;
  RxBool isLoading = false.obs;

  final service = Get.put(KabupatenKotaService());

  void onInit() async {
    super.onInit();
    await getKabupatenKota();
    print(listKabupatenKota);
  }

  Future<List<KabupatenKota>?> getKabupatenKota() async {
    isLoading.value = true;
    listKabupatenKota = await service.getKabupatenKotaService();
    isLoading.value = false;
    return listKabupatenKota;
  }
}
