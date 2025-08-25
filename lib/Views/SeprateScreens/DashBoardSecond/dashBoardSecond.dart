import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myBellIcon.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/myDropdown.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/stockchartpage/stock_chart.dart';

class Dashboardsecond extends StatelessWidget {
   Dashboardsecond({super.key});
  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomAvatar(assetPath: "assets/user.jpg"),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataText(text: "Welcome?", fontSize: 15),
                      DataText(text: "Ansh", fontSize: 15),
                    ],
                  ),
                  SizedBox(width: 10),
                  Spacer(),
                  Mybellicon(),
                ],
              ),
              SizedBox(height: 20),
              Row(

                children: [
                  GetBuilder<HomeController>(
                    builder: (at) {
                      return Mydropdown(
                        items: at.items,
                        selectedItem: at.selectedItem,
                        hint: "selected Branch",
                        onChanged: (val) {
                          at.updateSelectedItem(val!);

                        },
                      );
                    },
                  ),
                  Spacer(),

                  MyCustomDatePicker(),
                ],
              ),
              SizedBox(height: 20),
              GetBuilder<HomeController>(
                builder: (sp) {
                  return StockChart();
                },
              ),
              SizedBox(height: 20),
              DataText(text: "Tank Vise Stock", fontSize: 15),
              SizedBox(height: 10),

              Card(
                elevation: 3,
                // margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    headingRowColor:  MaterialStateProperty.all(AppColors.whiteBg),
                    dataRowColor: MaterialStateProperty.all(AppColors.whiteBg),
                    columnSpacing: 20, // Add spacing between columns
                    headingRowHeight: 40, // Adjust header height
                    dataRowHeight: 40, // Adjust row height
                    // headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                    columns: const [
                      DataColumn(
                        label: Text("Tank Name", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text("Fuel Type", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      DataColumn(
                        label: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ],
                    rows: data.map((row) {
                      return DataRow(
                        cells: [
                          DataCell(Column(
                            children: [
                              Text(row["tank"]!),


                            ],
                          )),
                          DataCell(Text(row["fuel"]!)),
                          DataCell(Text(row["quantity"]!)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
