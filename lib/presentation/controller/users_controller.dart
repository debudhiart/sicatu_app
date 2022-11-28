import 'dart:convert';
// import 'api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import 'dart:math';

import 'package:sicatu_app/data/datasources/models/user.dart';

import '../service/user_service.dart';

class UserController extends GetxController {
  // final String url = 'http://192.168.106.1:8000/api/user';
  List<User>? listUser;
  RxBool isLoading = false.obs;

  final service = Get.put(UserService());

  void onInit() async {
    super.onInit();
    await getUser();
    print(listUser);
  }

  // Future<List<User>> getStudent() async {
  //   var response = await http.get(Uri.parse(url));
  //   var data = json.decode(response.body);

  //   return List<User>.from(data["data"].map((x) => User.fromJson(x)));
  // }

  Future<List<User>?> getUser() async {
    isLoading.value = true;
    listUser = await service.getUserService();
    isLoading.value = false;
    return listUser;
  }
}
