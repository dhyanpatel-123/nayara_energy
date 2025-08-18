
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

TextEditingController EmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();

clearLoginFields() {
  EmailController.clear();
  PasswordController.clear();
}

}


class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}