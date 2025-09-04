import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/RefillController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';

class RefillScreen extends StatelessWidget {
  RefillScreen({super.key});

  TextEditingController Refill = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: MyCustomAppbar(title: "Refill Tanks", centerTitle: true, wantIcon: true),
      body: GetBuilder<RefillController>(
        builder: (ro) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: mySize.width,
            height: mySize.height,
            child: SingleChildScrollView(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                    ],
                  ),

                  ListView.builder(
                    shrinkWrap: true, // makes it measure height based on children
                    physics: NeverScrollableScrollPhysics(),

                    itemCount: ro.dailyEntryRefilllist.length,
                    itemBuilder: (context, index) {
                      var aa = ro.dailyEntryRefilllist[index];
                      return SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: AppColors.whiteBg,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Column(
                              spacing: 10,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    DataText(text: 'TankName: ${aa['tank_name'] ?? ''}', fontSize: 15),
                                    DataText(text: '(Tank Capacity)', fontSize: 15, color: AppColors.darkGreen),

                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          showAleartAddRefillTanks(title: "Tank Name - Petrol", controller: Refill);
                                        },
                                        child: Row(
                                          spacing: 4,
                                          children: [
                                            Icon(Icons.add, color: AppColors.navyblue),
                                            DataText(text: "Add Refill Quantity", fontSize: 13),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
