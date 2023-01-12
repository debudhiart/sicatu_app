import 'dart:convert';
// import 'api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

// import 'dart:math';

import 'package:sicatu_app/data/datasources/models/user.dart';

import '../service/user_detail_service.dart';
import '../service/user_service.dart';

class UserDetailController extends GetxController {
  // final String url = 'http://192.168.106.1:8000/api/user';
  int? selectedIdDesa;
  List<User>? listUser;
  UserDetail? detailUser;
  RxBool isLoading = false.obs;

  TextEditingController namaController = TextEditingController();
  TextEditingController desaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController nomorhandphoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController passwordConfirmedController = TextEditingController();

  final service = Get.put(UserService());
  final detail_service = Get.put(UserDetailService());

  void onInit() async {
    super.onInit();
    // await getUser();
    // print(listUser);
  }

  // Future<List<User>?> getUser() async {
  //   isLoading.value = true;
  //   listUser = await service.getUserService();
  //   isLoading.value = false;
  //   return listUser;
  // }

  Future<UserDetail?> getDetailUser(int id) async {
    isLoading.value = true;
    detailUser = await detail_service.getDetailUserService(id);
    isLoading.value = false;
    return detailUser;
  }

  void resetForm() {
    namaController.clear();
    emailController.clear();
    alamatController.clear();
    nomorhandphoneController.clear();
    // selectedIdDesa = null;
    // selectedIdKabupatenKota = null;
    // selectedIdProvinsi = null;
  }

  Future<User?> editUser(int id) async {
    isLoading.value = true;
    try {
      final response = await detail_service.editDataUser(
        id,
        // int.parse(
        //   roleController.text,
        // ),
        // int.parse(
        //   desaController.text,
        // ),
        selectedIdDesa ?? 0,
        namaController.text,
        emailController.text,
        // passwordController.text,
        alamatController.text,
        nomorhandphoneController.text,
      );
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    // return response;
  }

  Future<User?> deleteUser(int id) async {
    isLoading.value = true;
    await service.deleteDataUserService(id);
    isLoading.value = false;
  }
}
