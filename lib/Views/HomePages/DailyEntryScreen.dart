import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
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

  @override
  Widget build(BuildContext context) {
    // final HomeController date = Get.put(HomeController());
    TextEditingController DailyEntryController = TextEditingController();
    var mySize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: MyCustomAppbar(title: "Daily Entry", centerTitle: true),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          width: mySize.width,
          height: mySize.height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [MyCustomDatePicker()]),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true, // makes it measure height based on children
                  physics: NeverScrollableScrollPhysics(),

                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  DataText(text: 'TankName: ${data[index]['fuel'] ?? ''}', fontSize: 15),
                                  DataText(text: data[index]['fuel'] ?? '', fontSize: 15),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showAleartAddDailyEntry(title: "Tank name", controller: DailyEntryController);
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        DataText(text: "Today's Closing Entry", fontSize: 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
