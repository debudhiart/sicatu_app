import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sicatu_app/data/datasources/models/kecamatan.dart';
import 'package:sicatu_app/presentation/controller/kabupaten_kota_controller.dart';
import 'package:sicatu_app/presentation/controller/kecamatan_controller.dart';
import 'package:sicatu_app/presentation/controller/provinsi_controller.dart';

import '../../data/datasources/models/desa.dart';
import '../../data/datasources/models/kabupaten_kota.dart';
import '../../data/datasources/models/provinsi.dart';
import '../service/desa_service.dart';

class DesaController extends GetxController {
  int? selectedIdKecamatan;
  TextEditingController namaDesaController = TextEditingController();

  List<Desa>? listDesa;
  Desa? detailDesa;
  RxBool isLoading = false.obs;

  List<Kecamatan>? listKecamatan;

  final service = Get.put(DesaService());

  final kecamatanController = Get.put(KecamatanController());

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

  Future<List<Kecamatan>?> getKecamatan() async {
    listKecamatan = await kecamatanController.getKecamatan();
    return listKecamatan;
  }

  void resetForm() {
    namaDesaController.clear();
    selectedIdKecamatan = null;
    // selectedIdKabupatenKota = null;
    // selectedIdProvinsi = null;
  }

  Future<Desa?> createDesa() async {
    isLoading.value = true;
    try {
      final response = await service.saveNewDesa(
        selectedIdKecamatan ?? 0,
        // selectedIdKabupatenKota ?? 0,
        // selectedIdProvinsi ?? 0,
        namaDesaController.text,
      );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    // return response;
  }

  Future<Desa?> editDesa(int id) async {
    isLoading.value = true;
    try {
      final response = await service.editDataDesa(
        id,
        selectedIdKecamatan ?? 0,
        namaDesaController.text,
      );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    // return response;
  }

  Future<Desa?> deleteDesa(int id) async {
    isLoading.value = true;
    await service.deleteDataDesaService(id);
    isLoading.value = false;
  }
}
