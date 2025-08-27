import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myToast.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:nayara_energy_app/Views/BottomNavigation_Screens/Mainscreens.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  TextEditingController MobilenumberController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  clearLoginFields() {
    MobilenumberController.clear();
    PasswordController.clear();
  }



  login() async {

    try {
      var response = await http.post(
        Uri.parse(MyApis.login),
        body: {
          'mobilenumber': MobilenumberController.text,
          'password': PasswordController.text,
        },
      );
      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print("hello");


        MyToast.showCustom("Logged In ");
        await LoginSuccess(jsonData);

      } else {
        MyToast.showCustom("Logged Failed");

      }
    } catch (e) {
      MyToast.showCustom("Something went Wrong");
    } finally {

      update();
    }
  }


  LoginSuccess(jsonData) async {

    await mySharedPref().setData(
        jsonData['token']);
    Get.offAll(()=>Mainscreens(),binding:HomeScreenBinding());
    clearLoginFields();
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ////SignUp
  TextEditingController SignupFirstName = TextEditingController();
  TextEditingController SignupLastName = TextEditingController();
  TextEditingController SignupEmail = TextEditingController();
  TextEditingController SignupMobileNumber = TextEditingController();
  TextEditingController SignupPassword = TextEditingController();
  TextEditingController SignupConfirmPassword = TextEditingController();
  bool obscuresign1 = true;
  bool obscuresign2 = true;
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
      final jsonData = jsonDecode(response.body);
      print("responsbody:${response.body}");
      if (response.statusCode == 200) {
        Get.offAll(()=>Loginscreen());
        MyToast.showCustom("Account Created Successfully");
        // await SignUpSuccess(jsonData);

      } else {
        MyToast.showCustom("Failed to create account");

      }
    } catch (e) {
      print(e.toString());
      MyToast.showCustom("Something went Wrong");

    } finally {

      update();
    }
  }

  // SignUpSuccess(jsonData) async {
  //
  //   await mySharedPref().setData(
  //       jsonData['token']);
  //   Get.back();
  //   clearLoginFields();
  // }



  ClearSignUpfields() {
    SignupFirstName.clear();
    SignupLastName.clear();
    SignupEmail.clear();
    SignupMobileNumber.clear();
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
