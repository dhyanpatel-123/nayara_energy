import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLoading = true;
    initData();
  }

  RefreshapiData() async {
    await branch();
    await dashboard();
  }

  initData() async {
     branch();
     dashboard();
  }

  bool isLoading = false;

  DateTime selectedDate = DateTime.now();

   ChangeDatePicker() {
    showDatePicker(context: Get.context!, firstDate: DateTime(1970), lastDate: DateTime.now()).then((value) {
      if (value != null) {
        selectedDate = value;

        update();

      }
    });
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

  // var items = ["Syamal", "NaviMumbai", "JivrajPark", "Vastral"]; // dropdown options
  // var selectedItem = ""; // selected value (observable)
  //
  // void updateSelectedItem(String value) {
  //   selectedItem = value;
  //   update(); // rebuild GetBuilder
  // }

  //////////////////////////////////
  String dashBoradData = "";

  bool isDashBoardLoading = false;
  var dashBoardDataList = {};

  // List dashBoardTotalList = [];

  dashboard() async {
    var token = await mySharedPref().getData("token");




    try {
      dashBoardDataList.clear();
      final url = "${MyApis.dashborad}?branch_id=${"1"}";

      var response = await http.get(Uri.parse(url), headers: {'x-api-key': '$token'});

      final jsonData = jsonDecode(response.body);
      print(jsonData);
      if (response.statusCode == 200) {
        dashBoardDataList = {'data': jsonData['data'] ?? [], 'total_level': jsonData['total_level'] ?? []};
        print("dashboardList:${dashBoardDataList}");

        // combinedList=[
        //   ...dashBoardTotalList,
        //   ...dashBoardTotalList
        // ];
      } else {
        print("api failed");
        dashBoardDataList.clear();
      }
    } catch (e, s) {
      print("Something went wrong");
      print("Stack:${s}");
      dashBoardDataList.clear();
    } finally {
      isLoading = false;
      update();
    }
  }

  //////////////////////////////
  void updateSelectedBranch(val) async {
    selecteBranch = val;
    update();
    await branch();
  }

  var selecteBranch = null;
  var BranchList = [];
  bool isBranchLoading = false;

  branch() async {
    var token = await mySharedPref().getData("token");


    try {
      BranchList.clear();
      final url = "${MyApis.branchdropdown}";

      var response = await http.get(Uri.parse(url), headers: {'x-api-key': '$token'});

      final jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        BranchList.assignAll(jsonData['data']);

        if (BranchList.isNotEmpty) {
          selecteBranch = BranchList[0]['id'].toString();
        }
      } else {
        BranchList.clear();
        print("Api Failed");
      }
    } catch (e, s) {
      print("Something went Wrong ");
    } finally {
      update();
    }
  }

  ///////

  final List<Map<String, String>> data = [
    {"tank": "Tank Name", "fuel": "Petrol", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Petrolsssss", "quantity": "8756.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "875699999.20 ltr"},
    {"tank": "Tank Name", "fuel": "Diesel", "quantity": "8756.20 ltr"},
  ];

  List data2 = ['first', 'second', 'third', 'fourth'];

  bool isChange = true;
  List Emptydata2 = [];
  List data3 = ['first', 'second', 'third', 'fourth', "five", "six"];
  int expandedIndex = -1; // -1 means no row is open
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


}

////////////////////////////////////////
//Home screen data

/////////////////////////////////////////////////////////////////////


