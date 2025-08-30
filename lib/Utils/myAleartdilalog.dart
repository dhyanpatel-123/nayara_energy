import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/HomePages/DailyEntryScreen.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';

void showAleartAddDailyEntry({required String title, required TextEditingController controller}) {
  showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return  AlertDialog(
        backgroundColor: AppColors.whiteBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // keep it rounded
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: AppColors.navyblue, fontWeight: FontWeight.w500),
        ),
        content: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisSize: MainAxisSize.min,
           children: [
             DataText(text: "Nozzle name", fontSize: 15, color: AppColors.navyblue),
             SizedBox(height: 10),
             myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController: controller),

             SizedBox(height: 15),
             DataText(text: "Nozzle name", fontSize: 15, color: AppColors.navyblue),
             SizedBox(height: 10),
             myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController: controller),

             SizedBox(height: 15),
             DataText(text: "Nozzle name", fontSize: 15, color: AppColors.navyblue),
             SizedBox(height: 10),
             myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController: controller),
           ],
         ),

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
              mySmallButton(
                title: "Submit",
                onTap: () {
                  Get.to(() => Dailyentrydetailscreen());
                },
              ),
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
        title: Text(title, style: TextStyle(fontSize: 15)),
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
