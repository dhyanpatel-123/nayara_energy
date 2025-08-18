import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:get/get.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Loginscreen(),
    );
  }
}

class initialBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
  }
}
