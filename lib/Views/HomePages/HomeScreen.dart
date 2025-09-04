import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myLoadingWidget.dart';
import 'package:nayara_energy_app/Utils/mycalender.dart';
import 'package:nayara_energy_app/Utils/mycustomappbar.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/homeExtrapages/cardTable.dart';
import 'package:nayara_energy_app/Views/SeprateScreens/homeExtrapages/stockchartpage/stock_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: MyCustomAppbar(title:"Home",wantBackButton: false,wantIcon: true,),
      body: GetBuilder<HomeController>(builder: (at) {




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
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: mySize.width,
            height: mySize.height,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [


                MyCustomDatePicker(onTap:(){
              at.ChangeDatePicker();
              at.dashboard();


          } ,TextWidget: DataText(text:DateFormat('EEE dd ,yyyy').format(at.selectedDate), fontSize: 15),),

                  ],
                ),

                StockChart(),

                DataText(text: "Tank Vise Stock", fontSize: 17),

                Cardtable(),

              ],
            ),
          );
        }


      },)
    );
  }
}
