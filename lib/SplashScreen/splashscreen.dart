

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/BottomNavigationController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';


import '../Utils/myImages.dart';
class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Image.asset(

          splashImage,
          fit: BoxFit.fill,
          height: mySize.height*.6,
          width: mySize.width,
        ),
      ),
    );
  }
}
