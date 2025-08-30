import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/BottomNavigationController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Controller/authController.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:nayara_energy_app/Views/BottomNavigation_Screens/Mainscreens.dart';
import 'package:nayara_energy_app/Views/HomePages/HomeScreen.dart';

class SplshContoller extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    NavigatePage();
  }
  NavigatePage()async=>await Future.delayed(
    const Duration(seconds: 2),
      ()async{
      var token = await mySharedPref().getData("token");
      print("token:${token}");
      if(token==null){
        Get.offAll(()=>Loginscreen(),
          binding: AuthBinding(),
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear
        );
      }else{
        Get.offAll(()=>Mainscreens(),
          binding: BottomNavBinding(),
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear

        );

      }
      }
  );




}