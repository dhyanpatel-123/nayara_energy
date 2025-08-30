import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/SplashScreen/splashscreen.dart';
import 'package:nayara_energy_app/Utils/myBellIcon.dart';
import 'package:nayara_energy_app/Utils/myBranchIcon.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/myLoadingWidget.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/homeExtrapages/cardTable.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/homeExtrapages/stockchartpage/stock_chart.dart';
import 'package:nayara_energy_app/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (at) {

        print("foundData:${at.dashBoardDataList}");


        if(at.isLoading){
          print("Loading");
          return myLoading();


        }else if(at.dashBoardDataList.isEmpty ){
          return Center(
            child: myNoDataWidget("No Data Found", (){
              at.RefreshapiData();
            }),
          );

        }else{
          return Container(
            padding: EdgeInsets.only(top: 60, left: 15, right: 15),
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
                    myBranchIcon(onTap: (){


                    }, ImagePath: "assets/Blogo.png")
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                    GetBuilder<HomeController>(builder: (at) {
                      return  MyCustomDatePicker(onTap:(){
                        at.ChangeDatePicker();
                        at.dashboard();


                      } ,TextWidget: DataText(text:DateFormat('EEE dd ,yyyy').format(at.selectedDate), fontSize: 15),);
                    },)

                  ],
                ),
                SizedBox(height: 20),
                StockChart(),
                SizedBox(height: 20),
                DataText(text: "Tank Vise Stock", fontSize: 20, fontWeight: FontWeight.bold),
                SizedBox(height: 10),
                Flexible(child: Cardtable()),
                SizedBox(height: 20),
              ],
            ),
          );
        }


      },)
    );
  }
}
