import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';

import '../../data/datasources/models/shift.dart';

import '../service/shift_service.dart';

class ShiftController extends GetxController {
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
}
