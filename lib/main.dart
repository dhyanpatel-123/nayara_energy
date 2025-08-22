import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/SplashController.dart';
import 'package:nayara_energy_app/SplashScreen/splashscreen.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:get/get.dart';

void main() {
  Get.put(SplshContoller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: initialBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),

      home: SplashScreen(),
    );
  }
}

class initialBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}
