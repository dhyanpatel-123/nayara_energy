import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';

class Collectionreport extends StatelessWidget {
   Collectionreport({super.key});
  final List<Map<String, String>> data = [
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},
    {"Date":"09-06-2024","tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr","total":"12300",},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppbar(title: "Collection Report", centerTitle: true),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // ===== Header =====
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        child:  Center(child: Text("Day",style: TextStyle(color: AppColors.darkGreen,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                        width: 20,

                        // space taken by divider
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: const Center(child: Text("Week",style: TextStyle(color: AppColors.navyblue,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                        width: 20,

                        // space taken by divider
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: const Center(child: Text("Month",style: TextStyle(color: AppColors.navyblue,fontWeight: FontWeight.bold),)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: VerticalDivider(
                        color: Colors.black,
                        thickness: 2,
                        width: 20,

                        // space taken by divider
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: const Center(child: Text("3Month",style: TextStyle(color: AppColors.navyblue,fontWeight: FontWeight.bold),)),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            // ===== ListView (Scrollable) =====

         Card(
           child: buildUi(),
         )


          ],
        ),
      ),
    );
  }
   Widget buildUi(){
  return SingleChildScrollView(
    scrollDirection:Axis.horizontal,
    child: DataTable(


      columnSpacing: 20,
      headingRowHeight: 50,
      dataRowHeight: 100,
      headingRowColor:  MaterialStateProperty.all(AppColors.whiteBg),
      dataRowColor: MaterialStateProperty.all(AppColors.lightblue),
      columns:[
      DataColumn(

        label: Text("Tank Name",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text("Fuel Type",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text("Quantity",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text("Quantity",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      DataColumn(
        label: Text("Quantity",
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
        DataColumn(
          label: Text("Quantity",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
    ] , rows:data.map((row){
      return DataRow(cells: [
        DataCell(Column(
          children: [
            Text(row["Date"]!),
          ],
        )),



        DataCell(
            Column(
          children: [
            SizedBox(height: 5,),
            Text(row["fuel"]!),
            SizedBox(height: 5,),
            Text(row["fuel"]!),

          ],
        )),
        DataCell(Column(
          children: [
            SizedBox(height: 5,),
            Text(row["quantity"]!),
            SizedBox(height: 5,),
            Text(row["quantity"]!),



          ],
        )),
        DataCell(Column(
          children: [
            SizedBox(height: 5,),
            Text(row["quantity"]!),
            SizedBox(height: 5,),
            Text(row["quantity"]!),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Text("Total", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )),
        DataCell(Column(
          children: [
            SizedBox(height: 5,),
            Text(row["total"]!),
            SizedBox(height: 5,),
            Text(row["total"]!),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Text("23333",style: TextStyle(fontWeight: FontWeight.bold)),

          ],
        )),
        DataCell(Column(
          children: [
            SizedBox(height: 5,),
            Text(row["total"]!),
            SizedBox(height: 5,),
            Text(row["total"]!),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Text("23333",style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        )),
      ]);
    }).toList(),

    ),
  );
   }


   Widget _verticalDivider = const VerticalDivider(
     color: Colors.black,
     thickness: 1,
   );
}
