import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

class StockChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (da) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.navyblue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Current Total Stock',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),

              // Chart + Legend side by side
              Row(
                children: [
                  // Custom legend on LEFT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLegendItem(
                        color: AppColors.skyblue,
                        text: "Petrol: ${da.petrolStock.toStringAsFixed(2)} ltr.",
                      ),
                      SizedBox(height: 8),
                      _buildLegendItem(
                        color: AppColors.mediumgreen,
                        text: "Diesel: ${da.dieselStock.toStringAsFixed(2)} ltr.",
                      ),
                    ],
                  ),
                  SizedBox(width: 16),

                  // Chart on RIGHT
                  Expanded(
                    child: Container(
                      height: 80,
                      child: SfCircularChart(
                        legend: Legend(isVisible: false), // hide default legend
                        series: <CircularSeries>[
                          DoughnutSeries<StockData, String>(
                            dataSource: [
                              StockData(
                                'Petrol',
                                da.petrolStock.toDouble(),
                                AppColors.skyblue,
                              ),
                              StockData(
                                'Diesel',
                                da.dieselStock.toDouble(),
                                AppColors.mediumgreen,
                              ),
                            ],
                            xValueMapper: (StockData data, _) => data.fuelType,
                            yValueMapper: (StockData data, _) => data.quantity,
                            pointColorMapper: (StockData data, _) => data.color,
                            innerRadius: '70%',
                            dataLabelSettings: DataLabelSettings(isVisible: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(width: 6),
      Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}

class StockData {
  final String fuelType;
  final double quantity;
  final Color color;

  StockData(this.fuelType, this.quantity, this.color);
}
