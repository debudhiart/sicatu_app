import 'package:get/get.dart';

import '../../data/datasources/models/jadwal_pelanggan.dart';
import '../../data/datasources/models/jenis_langganan.dart';
import '../service/jadwal_pelanggan_service.dart';
import '../service/jenis_langganan_service.dart';

class JenisLanggananController extends GetxController {
  JenisLangganan? detailJenisLangganan;
  List<JenisLangganan>? listJenisLangganan;
  RxBool isLoading = false.obs;

  final service = Get.put(JenisLanggananService());

  void onInit() async {
    super.onInit();
    await getJenisLangganan();
    print(listJenisLangganan);
  }

  Future<List<JenisLangganan>?> getJenisLangganan() async {
    isLoading.value = true;
    listJenisLangganan = await service.getJenisLanggananService();
    isLoading.value = false;
    return listJenisLangganan;
  }

  Future<JenisLangganan?> getDetailJenisLangganan(int id) async {
    isLoading.value = true;
    detailJenisLangganan = await service.getDetailJenisLanggananService(id);
    isLoading.value = false;
    print(detailJenisLangganan);
    return detailJenisLangganan;
  }
}
