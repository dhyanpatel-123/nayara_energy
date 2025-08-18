import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';

class Dateentrydetailscreen extends StatelessWidget {
  const Dateentrydetailscreen({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> data = [
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},


      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},

    ];


    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppbar(title: "Tank Name-Petrol", centerTitle: true),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                  // padding: EdgeInsets.only(left: 20, right: 20),
                // width: mySize.width,
                // height: mySize.height,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      // margin: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 20, // Add spacing between columns
                          headingRowHeight: 40, // Adjust header height
                          dataRowHeight: 40, // Adjust row height
                          // headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                          columns: const [
                            DataColumn(label: Text("Tank Name", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Fuel Type", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: data.map((row) {
                            return DataRow(cells: [
                              DataCell(Text(row["tank"]!)),
                              DataCell(Text(row["fuel"]!)),
                              DataCell(Text(row["quantity"]!)),
                              DataCell(Text(row["quantity"]!)),
                              DataCell(Text(row["quantity"]!)),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
          
          
                  ],
          
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}
