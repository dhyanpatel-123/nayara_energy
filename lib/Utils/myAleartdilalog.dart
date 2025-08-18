import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';

void showAleartAddDailyEntry({required String title, required TextEditingController controller}) {
  showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteBg,
        // Native Android dialog
        title: Text(title),
        content: myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController: controller),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mySmallButton(
                inverted: true,
                title: "Cancel",
                onTap: () {
                  Get.back();
                },
              ),
              mySmallButton(title: "Submit", onTap: () {}),
            ],
          ),
        ],
      );
    },
  );
}

void showAleartAddRefillTanks({required String title, required TextEditingController controller}) {
  showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteBg,
        // Native Android dialog
        title: Text(title),
        content: myCustomTextfield(hinttext: "Please Add Refilled Qty here", textEditingController: controller),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              mySmallButton(
                inverted: true,
                title: "Cancel",
                onTap: () {
                  Get.back();
                },
              ),
              mySmallButton(title: "Submit", onTap: () {}),
            ],
          ),
        ],
      );
    },
  );
}
