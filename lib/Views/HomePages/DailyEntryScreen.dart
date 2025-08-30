import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/DailyEntryController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myDropdown.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/HomePages/HomeScreen.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';

class DailyEntryScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];
  DailyEntryScreen({super.key});
  TextEditingController AddTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: MyCustomAppbar(title: "Daily Entry", centerTitle: true),
      body: GetBuilder<DailyEntryContoller>(
        builder: (da) {
          return Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            width: mySize.width,
            height: mySize.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: ListView.builder(
                    itemCount: da.dailylist.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 100,
                        child: Card(
                          elevation: 2,

                          color: AppColors.whiteBg,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DataText(
                                      color: AppColors.navyblue,
                                      text: 'TankName: ${da.dailylist[index]['fuel_type'].toString()}',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    DataText(text: "(Current Qty.)", fontSize: 15, fontWeight: FontWeight.bold),
                                  ],
                                ),
                                const SizedBox(height: 8), // spacing between rows
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showAleartAddDailyEntry(title: 'Tank Name-P-Nozzle 1', controller: AddTextController);
                                      },
                                      child: DataText(
                                        text: '${da.dailylist[index]['nozzle_name'].toString()}',
                                        fontSize: 15,
                                        color: AppColors.darkGreen,
                                      ),
                                    ),
                                    DataText(
                                      text: '${da.dailylist[index]['starting_qty'].toString()} Ltr.',
                                      fontSize: 15,
                                      color: AppColors.navyblue,
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
