import 'dart:convert';
// import 'api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

// import 'dart:math';

import 'package:sicatu_app/data/datasources/models/user.dart';
import 'package:sicatu_app/presentation/controller/desa_controller.dart';

import '../../data/datasources/models/desa.dart';
import '../service/desa_service.dart';
import '../service/user_detail_service.dart';
import '../service/user_service.dart';

class UserController extends GetxController {
  int? selectedIdDesa;
  int? selectedIdRole;

  // final String url = 'http://192.168.106.1:8000/api/user';
  TextEditingController namaController = TextEditingController();
  // TextEditingController desaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  // TextEditingController nomorhandphoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmedController = TextEditingController();

  List<User>? listUser;
  User? user;
  // UserDetail? detailUser;
  RxBool isLoading = false.obs;
  List<Desa>? listDesa;

  final service = Get.put(UserService());
  // final detail_service = Get.put(UserDetailService());
  final desaController = Get.put(DesaController());

  // void onInit() async {
  //   super.onInit();
  //   await getUser();
  // }

  void resetForm() {
    namaController.clear();
    selectedIdDesa = null;
    emailController.clear();
    alamatController.clear();
    roleController.clear();
    selectedIdRole = null;
    passwordController.clear();
    passwordConfirmedController.clear();
  }

  Future<List<User>?> getUser() async {
    isLoading.value = true;
    listUser = await service.getUserService();
    isLoading.value = false;
    return listUser;
  }

  Future<List<Desa>?> getDesa() async {
    listDesa = await desaController.getDesa();
    return listDesa;
  }

  Future<User?> createUser() async {
    isLoading.value = true;
    try {
      final response = await service.saveNewUser(
          // int.parse(
          //   roleController.text,
          // ),
          selectedIdDesa ?? 0,
          selectedIdRole ?? 0,
          namaController.text,
          emailController.text,
          passwordController.text,
          alamatController.text,
          passwordConfirmedController.text);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
    // return response;
  }
}
