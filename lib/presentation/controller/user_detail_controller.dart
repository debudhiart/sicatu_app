import 'dart:convert';
// import 'api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sicatu_app/data/datasources/models/detail_user.dart';

// import 'dart:math';

import 'package:sicatu_app/data/datasources/models/user.dart';

import '../service/user_detail_service.dart';
import '../service/user_service.dart';

class UserDetailController extends GetxController {
  // final String url = 'http://192.168.106.1:8000/api/user';
  List<User>? listUser;
  UserDetail? detailUser;
  RxBool isLoading = false.obs;

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
}
