import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Controller/SplashController.dart';
import 'package:nayara_energy_app/Controller/authController.dart';
import 'package:nayara_energy_app/SplashScreen/splashscreen.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/Auth/LoginScreen.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';

void showAleartAddDailyEntry() {
  showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: AppColors.whiteBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // keep it rounded
        ),
        title: Text(
          "TankName-P -Nozzle1",
          style: TextStyle(fontSize: 20, color: AppColors.navyblue, fontWeight: FontWeight.w500),
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75, // 80% of screen width
          child: GetBuilder<DailyEntryContoller>(
            builder: (da) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DataText(text: "Start Qty:-", fontSize: 15, color: AppColors.darkGreen),
                  SizedBox(height: 10),
                  myCustomTextfield(
                    hinttext: "Please Add Start Qty here",
                    textEditingController: da.StartQtyEditingController,
                  ),

                  SizedBox(height: 15),
                  DataText(text: "Test Qty:-", fontSize: 15, color: AppColors.darkGreen),
                  SizedBox(height: 10),
                  myCustomTextfield(
                    hinttext: "Please Add Test Qty here",
                    textEditingController: da.TestQtyEditingController,
                  ),

                  SizedBox(height: 15),
                  DataText(text: "Usage Qty:-", fontSize: 15, color: AppColors.darkGreen),
                  SizedBox(height: 10),
                  myCustomTextfield(
                    hinttext: "Please Add Usage Qty here",
                    textEditingController: da.UsageQtyEditingController,
                  ),
                ],
              );
            },
          ),
        ),

        actions: [
          Row(
            children: [
              Expanded(
                child: mySmallButton(
                  inverted: true,
                  title: "Cancel",
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: mySmallButton(
                  title: "Submit",
                  onTap: () {
                    try {
                      Get.to(() => Dailyentrydetailscreen());
                    } catch (e) {
                      Get.back(); // closes the AlertDialog
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void showBranchAlertDialog() {
  showDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.whiteBg,
        title: const Text("Selected Branch"),
        content: GetBuilder<HomeController>(
          builder: (ho) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300, maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: ho.BranchList.length,
                itemBuilder: (context, index) {
                  bool isSelected = ho.selectedIndex == index;
                  var da = ho.BranchList[index];
                  bool _isChecked = false;
                  final branch = ho.BranchList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () async {
                                if (isSelected) {
                                  try {
                                    print("id2:${branch['id'].toString()}");
                                      await ho.setBranch(branch['id'].toString());
                                      await ho.getBranch();



                                    Get.deleteAll();

                                    Get.offAll(
                                      () => SplashScreen(),
                                      binding: BindingsBuilder(() {
                                        Get.put(SplshContoller());
                                      }),
                                    );
                                  } catch (e) {

                                  }
                                } else {

                                }


                              },
                              child: DataText(text: branch['branch_name'] ?? "No name", fontSize: 15),
                            ),
                          ),

                          SizedBox(width: 10),
                          Flexible(
                            child: CheckboxListTile(
                              activeColor: AppColors.navyblue,
                              value: isSelected,
                              onChanged: (val) {
                                ho.selectItem(index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
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
