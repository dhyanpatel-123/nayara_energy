import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  DateTime? selectedDate;
  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      selectedDate = picked;
      update(); // refresh UI
    }
  }

  /////////////////////////////////////////////////
                   //charts
  double petrolStock = 202.0;
  double dieselStock = 500.0;

  // Simulated API call
  Future<void> fetchStockData() async {
    await Future.delayed(Duration(seconds: 2)); // pretend API delay

    // Example API response
    var apiResponse = {"petrol": 100000.3, "diesel": 1589993.5};

    petrolStock = apiResponse["petrol"] ?? 0.0;
    dieselStock = apiResponse["diesel"] ?? 0.0;

    update(); // refresh UI
  }

  /////////////////////////////////////////////////
  @override
  void onInit() {
    super.onInit();
    // You can set initial values here if needed
  }
}
