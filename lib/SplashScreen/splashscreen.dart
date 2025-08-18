

import 'package:flutter/material.dart';


import '../Utils/myImages.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Image.asset(

        splashImage,
        fit: BoxFit.fill,
        height: 600,
        width: mySize.width,
      ),
    );
  }
}
