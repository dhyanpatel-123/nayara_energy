import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

Widget myLoading() {
  return const Center(
    child: CircularProgressIndicator(color: Colors.black, strokeWidth: 2,),
  );
}

Widget myNoDataWidget(title, VoidCallback ontap, {bool inBlack = false}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      DataText(text: title, fontSize: 15, color: inBlack ? Colors.black :Color(0xFF13447E)),
      const SizedBox(height: 10),
      ElevatedButton(
        style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color(0xFF13447E))),
        onPressed: ontap,
        child: const DataText(text: 'Refresh', fontSize: 15, color: Colors.white),
      ),
    ],
  );
}
