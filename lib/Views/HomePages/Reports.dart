import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myCalenderFromTo.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Views/HomePages/CollectionReport.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DataEntryDetailScreen.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/reportchart.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyCustomAppbar(title: "Reports", centerTitle: true),
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
                Row(children: [MyCustomDateFromTo(), SizedBox(width: 5)]),
                MyCustomDatePicker(),
                ProfitChartPage(),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>Collectionreport());
                  },
                    child: Text("CollectionReport")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
