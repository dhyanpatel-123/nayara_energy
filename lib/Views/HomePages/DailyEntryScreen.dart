import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myLoadingWidget.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class DailyEntryScreen extends StatelessWidget {
  DailyEntryScreen({super.key});
  TextEditingController AddTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: MyCustomAppbar(title: "Daily Entry", centerTitle: true),
      body: GetBuilder<DailyEntryContoller>(
        builder: (da) {
          if (da.isLoading) {
            print("Loading");
            return myLoading();
          } else if (da.dailyEntryNozzlelist.isEmpty) {
            return Center(
              child: myNoDataWidget("No Data Found", () {
                da.dailyEntryNozzle();
              }),
            );
          } else {
            return RefreshIndicator.adaptive(
              onRefresh: () async {

              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: mySize.width,
                height: mySize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyCustomDatePicker(
                          onTap: () {
                            da.ChangeDatePicker();
                            // at.dashboard();
                          },
                          TextWidget: DataText(text: DateFormat('EEE dd ,yyyy').format(da.selectedDate), fontSize: 15),
                        ),
                      ],
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: da.dailyEntryNozzlelist.length,
                        itemBuilder: (context, index) {
                          var tank = da.dailyEntryNozzlelist[index];

                          if (tank['nozzles'].isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Card(
                            elevation: 2,
                            color: AppColors.whiteBg,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: Column(
                                spacing: 5,

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Tank title row
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DataText(
                                        color: AppColors.navyblue,
                                        text: 'TankName-${tank['tank_name'].toString()}',
                                        fontSize: 15,
                                      ),
                                      DataText(text: "(Current Qty.)", fontSize: 15),
                                    ],
                                  ),

                                  // Nozzle rows
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: tank['nozzles'].length,
                                    itemBuilder: (context, nozzleIndex) {
                                      final nozzle = tank['nozzles'][nozzleIndex];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 6.0), // space between rows
                                        child: Row(


                                          spacing: 10,

                                          children: [
                                            // Left side: nozzle name + add
                                            DataText(
                                              text: nozzle['nozzle_name'].toString(),
                                              fontSize: 15,
                                              color: AppColors.darkGreen,
                                            ),
                                            GestureDetector(
                                              onTap: () async {

                                                Get.dialog(myLoading(),
                                                    barrierDismissible: false);
                                                try {
                                                  print("tankid:${tank['id']}");
                                                  await da.dailyEntryViewList(tank['id'].toString());
                                                  print("dataaaaaa: ${da.dailyEntryViewlist}");


                                                  if (Get.isDialogOpen == true) {
                                                    Get.back();
                                                  }

                                                  showAleartAddDailyEntry();
                                                } catch (e) {

                                                  print("Error: $e");
                                                  // Get.snackbar("Error", "Something went wrong");
                                                }
                                              },
                                              child: Icon(Icons.add, color: AppColors.navyblue),
                                            ),
                                            Spacer(),

                                            // Right side: qty
                                            DataText(
                                              text: (double.tryParse(nozzle['nozzle_current_qty'].toString()) ?? 0.0)
                                                  .toString(),
                                              fontSize: 15,
                                              color: AppColors.darkGreen,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
