import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nayara_energy_app/Utils/myToast.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';

class AuthController extends GetxController {
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



  login() async {

    try {
      var response = await http.post(
        Uri.parse(MyApis.login),
        body: {
          'mobilenumber': EmailController.text,
          'password': PasswordController.text,
        },
      );
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("hello");
       
        MyToast.showCustom("Logged In");
        clearLoginFields();
      } else {
        MyToast.showCustom("Logged Failed");

      }
    } catch (e) {
      MyToast.showCustom("Something went Wrong");
    } finally {

      update();
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////SignUp
  TextEditingController SignupFirstName = TextEditingController();
  TextEditingController SignupLastName = TextEditingController();
  TextEditingController SignupEmail = TextEditingController();
  TextEditingController SignupMobileNumber = TextEditingController();
  TextEditingController SignupMobileAddress = TextEditingController();
  TextEditingController SignupPassword = TextEditingController();
  TextEditingController SignupConfirmPassword = TextEditingController();

  SignUp() async {
    try {

      var response = await http.post(
        Uri.parse(MyApis.signup),
        body: {
          "first_name": SignupFirstName.text,
          "last_name": SignupLastName.text,
          "email": SignupEmail.text,
          "mobilenumber": SignupMobileNumber.text,
          "password": SignupPassword.text,
        },
      );
      if (response.statusCode == 200) {
        MyToast.showCustom("Logged In");
        ClearSignUpfields();
      } else {
        MyToast.showCustom("Logged Failed");
      }
    } catch (e) {
      MyToast.showCustom("Something went Wrong");
    } finally {

      update();
    }
  }

  ClearSignUpfields() {
    SignupFirstName.clear();
    SignupLastName.clear();
    SignupEmail.clear();
    SignupMobileNumber.clear();
    SignupMobileAddress.clear();
    SignupPassword.clear();
    SignupConfirmPassword.clear();
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
}

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
