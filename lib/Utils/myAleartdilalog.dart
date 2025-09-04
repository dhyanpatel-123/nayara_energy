import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/RefillController.dart';
import 'package:nayara_energy_app/Controller/SplashController.dart';
import 'package:nayara_energy_app/SplashScreen/splashscreen.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';

import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';

void showAleartAddDailyEntry() {
  final GlobalKey<FormState> _formKey = GlobalKey();
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
        title: GetBuilder<HomeController>(
          builder: (controller) {
            return Text("TankName-P -Nozzle1", style: TextStyle(fontSize: 18, color: AppColors.navyblue));
          },
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: GetBuilder<DailyEntryContoller>(
            builder: (da) {
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DataText(text: "Test Qty:-", fontSize: 15, color: AppColors.darkGreen),

                      myCustomTextfield(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),

                        // validator: (val) {
                        //   if (val!.isEmpty) {
                        //     return 'This field is required';
                        //   }
                        // },
                        hinttext: "Please Add Start Qty here",
                        textEditingController: da.TestQtyEditingController,
                      ),
                      DataText(text: "Start Qty:-", fontSize: 15, color: AppColors.darkGreen),

                      myCustomTextfield(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        // validator: (val) {
                        //   if (val!.isEmpty) {
                        //     return 'This field is required';
                        //   }
                        // },
                        hinttext: "Please Add Start Qty here",
                        textEditingController: da.StartingQtyEditingController,

                      ),


                        if(da.value>=2)...[
                          DataText(text: "End Qty:-", fontSize: 15, color: AppColors.darkGreen),
                          myCustomTextfield(
                            keyboardType: TextInputType.numberWithOptions(decimal: true),

                            // validator: (val) {
                            //   if (val!.isEmpty) {
                            //     return 'This field is required';
                            //   }
                            // },
                            hinttext: "Please Add End Qty here",
                            textEditingController: da.EndQtyEditingController,
                          ),
                          const SizedBox(height: 20),
                          if (da.value>=2)
                            ElevatedButton(
                              onPressed: () {
                                if (da.EndQtyEditingController.text.isNotEmpty) {
                                  da.value = 3;
                                  Get.back();
                                } else {
                                  Get.snackbar("Error", "Please fill End first");
                                }
                              },
                              child: const Text("Add last data"),
                            ),

              ],
                      if (da.value >= 3)
                      DataText(text: "Final Qty:-", fontSize: 15, color: AppColors.darkGreen),
                      myCustomTextfield(
                        keyboardType: TextInputType.numberWithOptions(decimal: true),

                        // validator: (val) {
                        //   if (val!.isEmpty) {
                        //     return 'This field is required';
                        //   }
                        // },
                        hinttext: "Please Add Final Qty here",
                        textEditingController: da.FinalQtyEditingController,

                      ),

                      // myCustomTextfield(
                      //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //
                      //   // validator: (val) {
                      //   //   if (val!.isEmpty) {
                      //   //     return 'This field is required';
                      //   //   }
                      //   // },
                      //   hinttext: "Please Add End Qty here",
                      //   textEditingController: da.EndQtyEditingController,
                      // ),
                      //
                      // DataText(text: "Final Qty:-", fontSize: 15, color: AppColors.darkGreen),
                      //
                      // myCustomTextfield(
                      //   keyboardType: TextInputType.numberWithOptions(decimal: true),
                      //
                      //   // validator: (val) {
                      //   //   if (val!.isEmpty) {
                      //   //     return 'This field is required';
                      //   //   }
                      //   // },
                      //   hinttext: "Please Add Final Qty here",
                      //   textEditingController: da.FinalQtyEditingController,
                      //
                      // ),
                      SizedBox(height: 10),

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
                              if (_formKey.currentState!.validate()) {
                                try {
                                  da.value = 2;
                                  da.dailyEntryAddList();
                                  Get.back();
                                  da.update();
                                } catch (e) {
                                  Get.back(); // closes the AlertDialog
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
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

                  final branch = ho.BranchList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          ho.selectedIndex = index;
                          ho.update();
                          try {
                            print("id2222:${branch['id'].toString()}");

                            await ho.setBranch(branch['id'].toString());

                            Get.deleteAll();

                            Get.offAll(
                              () => SplashScreen(),
                              binding: BindingsBuilder(() async {
                                Get.put(SplshContoller());
                              }),
                            );
                          } catch (e) {
                            print("Error: $e");
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DataText(text: branch['branch_name'] ?? "No name", fontSize: 15),
                              ),
                            ),

                            SizedBox(width: 10),
                            Flexible(
                              child: GestureDetector(
                                onTap: () async {
                                  ho.selectedIndex = index;
                                  ho.update();

                                  try {
                                    print("id2222:${branch['id'].toString()}");

                                    await ho.setBranch(branch['id'].toString());
                                  } catch (e) {
                                    print("Error: $e");
                                  }
                                },
                                child: Container(
                                  child: isSelected
                                      ? Icon(Icons.check_box, color: AppColors.navyblue)
                                      : Icon(Icons.check_box_outline_blank, color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
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
      return GetBuilder<RefillController>(builder: (ro) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,

          backgroundColor: AppColors.whiteBg,
          // Native Android dialog
          title: DataText(text: title, fontSize: 15),
          content: Column(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataText(text: "Supplier Name:-", fontSize: 15, color: AppColors.mediumgreen),
              myCustomTextfield(hinttext: "Select supplier Name", textEditingController: ro.SupplierEditingController),
              DataText(text: "Refilled:-", fontSize: 15, color: AppColors.mediumgreen),
              myCustomTextfield(hinttext: "Please Add Refilled Quantity here", textEditingController: ro.RefilledEditingController),
              DataText(text: "Price:-", fontSize: 15, color: AppColors.mediumgreen),
              myCustomTextfield(hinttext: "Please Add Price here", textEditingController: ro.RefilledEditingController),
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
                mySmallButton(title: "Submit", onTap: () {}),
              ],
            ),
          ],
        );
      },);
    },
  );
}
