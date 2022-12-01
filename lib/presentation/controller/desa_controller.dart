import 'package:get/get.dart';

import '../../data/datasources/models/desa.dart';
import '../service/desa_service.dart';

class DesaController extends GetxController {
  List<Desa>? listDesa;
  Desa? detailDesa;
  RxBool isLoading = false.obs;

  final service = Get.put(DesaService());

  void onInit() async {
    super.onInit();
    await getDesa();
    print(listDesa);
  }

  Future<List<Desa>?> getDesa() async {
    isLoading.value = true;
    listDesa = await service.getDesaService();
    isLoading.value = false;
    return listDesa;
  }

  Future<Desa?> getDetailDesa(int id) async {
    isLoading.value = true;
    detailDesa = await service.getDetailDesaService(id);
    isLoading.value = false;
    print(detailDesa);
    return detailDesa;
  }
}
