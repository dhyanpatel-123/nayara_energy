import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class Cardtable extends StatelessWidget {
  const Cardtable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (ad) {
        var data=ad.dashBoardDataList['data'];
        return Card(
          margin: EdgeInsets.zero,
          color: AppColors.whiteBg,
          elevation: 3,
          child: RefreshIndicator.adaptive(
            onRefresh: () async {
              await ad.dashboard();
            },
            child: Column(
                children: [
            // Header row
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DataText(
                    text: "Tank Name",
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                // Expanded(
                //   flex: 2,
                //   child: DataText(
                //     text: "Fuel Type",
                //     fontSize: 15,
                //     color: Colors.black,
                //     fontWeight: FontWeight.w700,
                //   ),
                // ),
                SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: DataText(
                      text: "Quantity",
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Expanded(flex: 1, child: SizedBox()), // space for expand button
              ],
            ),
          ),
          Divider(),


          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 300, // maximum height for the scrollable list
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: data.length,
              itemBuilder: (context, index) {
                bool isExpanded = ad.expandedIndex == index;
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.whiteBg,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: DataText(
                                  text: data[index]['tank_name'].toString(),
                                  fontSize: 15,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 10),

                              DataText(
                                text: data[index]['current_level'].toString(),
                                fontSize: 15,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              IconButton(

                                onPressed: () {
                                  if (ad.expandedIndex == index) {
                                    ad.expandedIndex = -1;
                                  } else {
                                    ad.expandedIndex = index;
                                  }
                                  ad.update();
                                },
                                icon: Icon(Icons.keyboard_arrow_down),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: DataText(
                          text: data[index]['fuel_type'].toString(),
                          fontSize: 15,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      if (isExpanded)
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(8),
                          child: Text(ad.data3[index].toString()),
                        ),

                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),

          ],
        ),
        ),
        );

      },)


    );
  }
}
