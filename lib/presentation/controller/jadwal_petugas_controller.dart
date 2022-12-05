import 'package:get/get.dart';

import '../../data/datasources/models/jadwal_petugas.dart';
import '../service/jadwal_petugas_service.dart';

class JadwalPetugasController extends GetxController {
  JadwalPetugas? detailJadwalPetugas;
  List<JadwalPetugas>? listJadwalPetugas;
  RxBool isLoading = false.obs;

  final service = Get.put(JadwalPetugasService());

  void onInit() async {
    super.onInit();
    await getJadwalPetugas();
    print(listJadwalPetugas);
  }

  Future<List<JadwalPetugas>?> getJadwalPetugas() async {
    isLoading.value = true;
    listJadwalPetugas = await service.getJadwalPetugasService();
    isLoading.value = false;
    return listJadwalPetugas;
  }

  Future<JadwalPetugas?> getDetailJadwalPetugas(int id) async {
    isLoading.value = true;
    detailJadwalPetugas = await service.getDetailJadwalPetugasService(id);
    isLoading.value = false;
    print(detailJadwalPetugas);
    return detailJadwalPetugas;
  }
}
