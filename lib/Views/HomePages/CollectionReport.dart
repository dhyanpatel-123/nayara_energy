import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';

class Collectionreport extends StatelessWidget {
  const Collectionreport({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {"No": "10/12/2024", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"No": "2", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "3", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "4", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},

      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
      {"No": "1", "tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    ];

    return Scaffold(
      appBar: MyCustomAppbar(title: "Collection Report", centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(child: Center(child: Text("Day"))),
                    ),
        
                    Expanded(
                      child: Container(child: Center(child: Text("Week"))),
                    ),
                    Expanded(
                      child: Container(child: Center(child: Text("Month"))),
                    ),
                    Expanded(
                      child: Container(child: Center(child: Text("3Month"))),
                    ),
                  ],
                ),
              ),
            ),
            Card(
        
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  
                  columnSpacing: 20, // Add spacing between columns
                  headingRowHeight: 59, // Adjust header height
                  dataRowHeight: 120, // Adjust row height
                  // headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                  columns: [
                    DataColumn(
                      label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Sell Qty", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Price/Ltr", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    DataColumn(
                      label: Text("Profit", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                  rows: data.map((row) {
                    return DataRow(
                      cells: [
                        DataCell(Column(children: [Text(row['No']??"")])),
                        DataCell(Column(children: [
                          Text(row['tank']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),




                        ])),
                        DataCell(Column(children: [

                          Text(row['No']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),


                        ])),
                        DataCell(Column(children: [Text(row['No']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),

                        ])),
                        DataCell(Column(children: [

                          Text(row['No']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),

                        ])),
                        DataCell(Column(children: [Text(row['No']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),
                          SizedBox(height: 10,),
                          Text(row['tank']??""),
                        ])),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
