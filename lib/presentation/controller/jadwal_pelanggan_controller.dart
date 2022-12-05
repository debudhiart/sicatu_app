import 'package:get/get.dart';

import '../../data/datasources/models/jadwal_pelanggan.dart';
import '../service/jadwal_pelanggan_service.dart';

class JadwalPelangganController extends GetxController {
  JadwalPelanggan? detailJadwalPelanggan;
  List<JadwalPelanggan>? listJadwalPelanggan;
  RxBool isLoading = false.obs;

  final service = Get.put(JadwalPelangganService());

  void onInit() async {
    super.onInit();
    await getJadwalPelanggan();
    print(listJadwalPelanggan);
  }

  Future<List<JadwalPelanggan>?> getJadwalPelanggan() async {
    isLoading.value = true;
    listJadwalPelanggan = await service.getJadwalPelangganService();
    isLoading.value = false;
    return listJadwalPelanggan;
  }

  Future<JadwalPelanggan?> getDetailJadwalPelanggan(int id) async {
    isLoading.value = true;
    detailJadwalPelanggan = await service.getDetailJadwalPelangganService(id);
    isLoading.value = false;
    print(detailJadwalPelanggan);
    return detailJadwalPelanggan;
  }
}
