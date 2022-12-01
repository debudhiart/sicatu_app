import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';

import '../../data/datasources/models/shift.dart';

import '../service/shift_service.dart';

class ShiftController extends GetxController {
  Shift? detailShift;
  List<Shift>? listShift;
  RxBool isLoading = false.obs;

  final service = Get.put(ShiftService());

  void onInit() async {
    super.onInit();
    await getShift();
    print(listShift);
  }

  Future<List<Shift>?> getShift() async {
    isLoading.value = true;
    listShift = await service.getShiftService();
    isLoading.value = false;
    return listShift;
  }

  Future<Shift?> getDetailShift(int id) async {
    isLoading.value = true;
    detailShift = await service.getDetailShiftService(id);
    isLoading.value = false;
    print(detailShift);
    return detailShift;
  }
}
