import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';

class HomeController extends GetxController {
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();






  }







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

  DateTime? selectedDateFrom;
  Future<void> pickDateFrom(BuildContext context) async {
    final pickedFrom = await showDatePicker(
      context: context,
      initialDate: selectedDateFrom ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedFrom != null) {
      selectedDateFrom = pickedFrom;
      update(); // refresh UI
    }
  }

  DateTime? selectedDateTo;
  Future<void> pickDateTo(BuildContext context) async {
    final pickedTo = await showDatePicker(
      context: context,
      initialDate: selectedDateTo ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedTo != null) {
      selectedDateTo = pickedTo;
      update(); // refresh UI
    }
  }

  ///////////////////////////

  var items = ["Syamal", "NaviMumbai", "JivrajPark", "Vastral"]; // dropdown options
  var selectedItem = ""; // selected value (observable)

  void updateSelectedItem(String value) {
    selectedItem = value;
    update(); // rebuild GetBuilder
  }


  //////////////////////////////
  String dashBoradData = "";

  bool isDashBoardLoading = false;
  List dashBoardDataList = [];
  List dashBoardTotalList = [];



  dashboard() async {
    var token = await mySharedPref().getData("token");

    isDashBoardLoading = true;


    try {

      final url = "${MyApis.dashborad}?branch_id={${"2"}";
      var response = await http.get(Uri.parse(url),

      headers: {
        'x-api-key': '$token',
      }
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dashBoardDataList.assignAll(jsonData['data']);
        dashBoardTotalList.assignAll(jsonData['total_level']);

      } else {
        print("api failed");
      }
    } catch (e,s) {
      print("something went wrong");
      print(s);
    } finally {
      isDashBoardLoading = false;
    }
  }
///////


  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];

  List data2=['first','second','third','fourth'];

  bool isChange= true;
  List Emptydata2=[];
  List data3=['first','second','third','fourth'];
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

}

////////////////////////////////////////
//Home screen data


/////////////////////////////////////////////////////////////////////

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
