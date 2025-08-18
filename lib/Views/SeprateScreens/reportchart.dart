// ProfitChartPage.dart
import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfitChartPage extends StatelessWidget {
  final double totalSell = 2025946.54;
  final double totalPurchase = 1915455.39;
  final double profit = 110567.85;

  @override
  Widget build(BuildContext context) {
    final chartData = [
      ChartData('Total Sell', totalSell, Colors.green),
      ChartData('Total Purchase', totalPurchase, Colors.blue),
    ];

    return Column(
      children: [
        const SizedBox(height: 20),

        SizedBox(
          height: 350, // 👈 adjust as you like
          child: SfCircularChart(
            annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Profit", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(
                      "₹${profit.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
            series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                dataSource: chartData,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
                radius: "80%",
                innerRadius: "65%",
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // 📋 Legends + Values
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Container(
              //   color: Colors.grey[300],
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         DataText(text: "Day", fontSize: 15),
              //         DataText(text: "Week ", fontSize: 15),
              //         DataText(text: "Month", fontSize: 15),
              //         DataText(text: "3Month", fontSize: 15),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.circle, color: Colors.green, size: 14),
                  const SizedBox(width: 6),
                  const Text("Total Sell"),
                  const Spacer(),
                  Text("₹${totalSell.toStringAsFixed(2)}"),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.circle, color: Colors.blue, size: 14),
                    const SizedBox(width: 6),
                  const Text("Total Purchase"),
                  const Spacer(),
                  Text("₹${totalPurchase.toStringAsFixed(2)}"),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  const Text("Profit", style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  Text("₹${profit.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final Color color;
  ChartData(this.x, this.y, this.color);
}
