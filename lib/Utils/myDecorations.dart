import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myImages.dart';

class myDecorations {
  static logoimageScreen(context) {
    return Image.asset(

        splashImage,
        height: 300,
        width: MediaQuery.sizeOf(context).width,
        fit: BoxFit.cover);
  }


}
