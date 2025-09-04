import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myLoadingWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class StockChart extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    return GetBuilder<HomeController>(
      builder: (da) {
        var total=da.dashBoardDataList['total_level'];
        return Container(padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: AppColors.navyblue, borderRadius: BorderRadius.circular(12)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(spacing: 5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Total Stock',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      _buildLegendItem(
                        color: AppColors.skyblue,
                        text: "Petrol: ${total[0]['petrol_total'].toString()}",
                      ),
                      _buildLegendItem(
                        color: AppColors.mediumgreen,
                        text: "Diesel: ${total[0]['diesel_total'].toString()}",
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  child: SfCircularChart(margin: EdgeInsets.zero,
                    legend: Legend(isVisible: false), // hide default legend
                    series: <CircularSeries>[
                      DoughnutSeries<StockData, String>(
                        dataSource: [
                          StockData(
                            'Petrol',
                            total[0]['petrol_total'].toString(),
                            AppColors.skyblue,
                          ),
                          StockData(
                            'Diesel',
                            total[0]['diesel_total'].toString(),
                            AppColors.mediumgreen,
                          ),
                        ],
                        xValueMapper: (StockData data, _) => data.fuelType,
                        yValueMapper: (StockData data, _) => (double.tryParse(data.quantity) ?? 0.0).abs(),
                        pointColorMapper: (StockData data, _) => data.color,
                        innerRadius: '75%',
                        dataLabelSettings: DataLabelSettings(isVisible: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );



      },
    );
  }
}
// Custom legend item
Widget _buildLegendItem({required Color color, required String text}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      SizedBox(width: 6),
      Text(text, style:TextStyle(fontSize: 15,color: Colors.white) ),
    ],
  );
}

class StockData {
  final String fuelType;
  final String quantity; // changed from double → String
  final Color color;

  StockData(this.fuelType, this.quantity, this.color);
}
