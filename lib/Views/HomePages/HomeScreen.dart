import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myButton.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Utils/mytextfiled.dart';
import 'package:nayara_energy_app/Views/HomePages/DailyEntry.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';

class Homescreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController date = Get.put(HomeController());
    TextEditingController DailyEntryController= TextEditingController();
    var mySize = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppbar(title: "Daily Entry", centerTitle: true),
        body: Container(
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
                                   onTap: (){

                                     showDialog(
                                       barrierDismissible: true,
                                       context: Get.context!,
                                       builder: (BuildContext context) {
                                         return AlertDialog(
                                           backgroundColor: AppColors.whiteBg,
                                           // Native Android dialog
                                           title: DataText(text: "Tank name - ${ data[index]['fuel'] ?? ''}", fontSize: 15),
                                           content: myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController:DailyEntryController ),
                                           actions: [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [
                                                mySmallButton(inverted:true,title: "Cancel", onTap: (){
                                                  Get.back();
                                                }),
                                                 mySmallButton(title: "Submit", onTap: (){
                                                   Get.to(Dateentrydetailscreen());
                                                 }),



                                               ],
                                             ),
                                           ],
                                         );
                                       },
                                     );
                                   },
                                   child: Row(
                                     children: [
                                       Icon(Icons.add),
                                       DataText(text: "Today's Closing Entry", fontSize: 15),
                                     ],
                                   ),
                                 )
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
