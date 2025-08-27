import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myBellIcon.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/myDropdown.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/DashBoardSecond/dashBoardSecond.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/stockchartpage/stock_chart.dart';

class HomeScreen extends StatelessWidget {





  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        width: mySize.width,
        height: mySize.height,
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

            StockChart(),

            SizedBox(height: 20),
            DataText(text: "Tank Vise Stock", fontSize: 15),
            SizedBox(height: 20),

        Card(
          elevation: 3,
          child: Column(
            children: [
              Row(

                children: [
                  Text("Tank Name"),
                  SizedBox(width: 40,),
                  Text("Fuel Type"),
                  SizedBox(width: 60,),
                  Text("Quantity"),

                ],
              ),
              Divider(),
              GetBuilder<HomeController>(builder: (ad) {
                return  Container(
                  height: 270,
                  child: ListView.builder(
                    padding: EdgeInsets.zero, // remove default padding
                    itemCount: ad.data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Container(
                              color:ad.isChange?Colors.white:Colors.blueAccent,
                              child: InkWell(
                                onTap: (){

                                  if(ad.Emptydata2.contains(ad.data2[index].toString())){


                                    ad.Emptydata2.remove(ad.data2[index].toString());
                                    ad.update();

                                  }else{
                                    ad.Emptydata2.add(ad.data2[index].toString());
                                    ad.update();
                                  }
                                  print("value");
                                  print("${ad.Emptydata2.toString()}");


                                  if(ad.data3.isNotEmpty){

                                    ad.isChange=!ad.isChange;
                                    ad.update();
                                  }






                                },
                                child: Row(
                                  children: [
                                    Text(ad.data[index]['tank'].toString()),
                                    SizedBox(width: 50,),
                                    Text(ad.data[index]['fuel'].toString()),
                                    SizedBox(width: 50,),
                                    Text(ad.data[index]['quantity'].toString()),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_drop_down),
                                    ),
                                  ],
                                ),



                              ),



                            ),
                          ad.isChange?SizedBox():Container(child: Text(ad.data3[index].toString()),),


                          Divider(),

                        ],
                      );
                    },
                  ),
                );
              },)

            ],
          ) ,
        )




          ],
        ),
      ),
    );
  }
}
