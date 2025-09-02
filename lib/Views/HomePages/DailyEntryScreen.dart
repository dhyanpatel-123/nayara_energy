import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
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
          return Container(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            width: mySize.width,
            height: mySize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          padding: const EdgeInsets.all(12),
                          child: Column(
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
                                    fontWeight: FontWeight.bold,
                                  ),
                                  DataText(
                                    text: "(Current Qty.)",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Nozzle rows
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: tank['nozzles'].length,
                                itemBuilder: (context, nozzleIndex) {
                                  final nozzle = tank['nozzles'][nozzleIndex];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Left side: nozzle name + add
                                        Row(
                                          children: [
                                            DataText(
                                              text: nozzle['nozzle_name'].toString(),
                                              fontSize: 15,
                                              color: AppColors.darkGreen,
                                            ),
                                            const SizedBox(width: 6),
                                            IconButton(
                                              onPressed: () async {
                                                try {
                                                  print("tankid:${tank['id']}");
                                                  var data = await da.dailyEntryViewList(tank['id'].toString());
                                                  print("dataaaaaa: $data");
                                                  showAleartAddDailyEntry();
                                                } catch (e) {
                                                  print("Error: $e");
                                                  Get.snackbar("Error", "Something went wrong");
                                                }
                                              },
                                              icon: const Icon(Icons.add),
                                              color: AppColors.navyblue,
                                              padding: EdgeInsets.zero,
                                              constraints: const BoxConstraints(),
                                            ),
                                          ],
                                        ),

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
          );
        },
      ),
    );
  }
}
