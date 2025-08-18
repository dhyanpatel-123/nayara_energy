import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class StockChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Color(0xFF1E3A8A), borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Total Stock',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Container(
                height: 150,

                child: SfCircularChart(
                  legend: Legend(
                    isVisible: true,
                    toggleSeriesVisibility: false,

                    textStyle: TextStyle(color: Colors.white),
                    position: LegendPosition.left,
                  ),
                  series: <CircularSeries>[
                    DoughnutSeries<StockData, String>(
                      dataSource: [
                        StockData('Petrol', controller.petrolStock, Colors.lightBlue),
                        StockData('Diesel', controller.dieselStock, Colors.green),
                      ],
                      xValueMapper: (StockData data, _) => '${data.fuelType}: ${data.quantity.toStringAsFixed(2)} ltr.',
                      yValueMapper: (StockData data, _) => data.quantity,
                      pointColorMapper: (StockData data, _) => data.color,

                      innerRadius: '70%',
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

class StockData {
  final String fuelType;
  final double quantity;
  final Color color;
  StockData(this.fuelType, this.quantity, this.color);
}
