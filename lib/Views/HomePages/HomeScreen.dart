import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/stockchartpage/stock_chart.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController date = Get.put(HomeController());
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:60, left: 20, right: 20,),
        width: mySize.width,
        height: mySize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomAvatar(),
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
                // margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
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
                            DataCell(Text(row["tank"]!)),
                            DataCell(Text(row["fuel"]!)),
                            DataCell(Text(row["quantity"]!)),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
