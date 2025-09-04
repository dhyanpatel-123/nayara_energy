import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Utils/myToast.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/main.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';
import 'package:http/http.dart' as http;

class DailyEntryContoller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoading = true;
    dailyEntryList();
    dailyEntryNozzle();

  }





  DateTime selectedDate = DateTime.now();
  ChangeDatePicker() {
    showDatePicker(context: Get.context!, firstDate: DateTime(1970), lastDate: DateTime.now()).then((value) {
      if (value != null) {
        selectedDate = value;
        print("SelectedDate:${selectedDate}");

        update();

      }
    });
  }


  TextEditingController TestQtyEditingController=TextEditingController();
  TextEditingController StartingQtyEditingController= TextEditingController();
  TextEditingController EndQtyEditingController=TextEditingController();
  TextEditingController FinalQtyEditingController=TextEditingController();


  bool isLoading = false;

  var dailylist = [];
  dailyEntryList() async {
    try {
      dailylist.clear();
      var token = await mySharedPref().getData("token");

      final url = "${MyApis.dailyentrylist}?branch_id=${"1"}";

      var response = await http.get(Uri.parse(url),headers: {
        'x-api-key': '$token',
      });
      final jsonData = jsonDecode(response.body);
      print('datassssss:${response.body}');
      if (response.statusCode == 200) {
        dailylist.assignAll(jsonData['data']);
      } else {
        dailylist.clear();
        print("Api Failed");
      }
    } catch (e) {
      dailylist.clear();
      print("Somthing went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }

  var dailyEntryViewlist = [];
  dailyEntryViewList(String id) async {
    try {
      dailylist.clear();
      var token = await mySharedPref().getData("token");
      print("${token}");

      final url = "${MyApis.dailyentryview}?branch_id=${'2'}&id=${id}";


      var response = await http.get(Uri.parse(url),headers: {
        'x-api-key': '$token',
      });
      final jsonData = jsonDecode(response.body);
      print('datassssss1233:${response.body}');
      if (response.statusCode == 200) {
        dailyEntryViewlist.assignAll(jsonData['data']);
      } else {
        dailyEntryViewlist.clear();
        print("Api Failed");
      }
    } catch (e) {
      dailyEntryViewlist.clear();
      print("Somthing went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }

var  value=1;



  var dailyEntryAddlist = [];

  dailyEntryAddList() async {
    try {
      dailyEntryAddlist.clear();

      var token = await mySharedPref().getData("token");
      final url = "${MyApis.dailyentryadd}";

      // Prepare request body
      var bodyData = {
        'id': dailyEntryViewlist[0]['id'].toString(),
        'branch_id': "1",
        'fuel_type': dailyEntryViewlist[0]['fuel_type'].toString(),
        'tank_id': dailyEntryViewlist[0]['tank_id'].toString(),
        'nozzle_id': dailyEntryViewlist[0]['nozzle_id'].toString(),
        'entry_date': DateFormat('dd-MM-yyyy').format(selectedDate),
        'test_qty': TestQtyEditingController.text,
        'starting_qty': StartingQtyEditingController.text,
        'end_qty': EndQtyEditingController.text,
        'final_used_qty': FinalQtyEditingController.text,
      };

      print("🔹 API URL: $url");
      print("🔹 Token: $token");
      print("🔹 Request Body: $bodyData");

      var response = await http.post(
        Uri.parse(url),
        headers: {
          'x-api-key': token,
        },
        body: bodyData,
      );

      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      final jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // dailyEntryAddlist.assignAll(jsonData['data']);
        MyToast.showCustom("DailyEntry Data Added Successfully");
        print("✅ API Success: $jsonData");
      } else {
        dailyEntryAddlist.clear();
        print("❌ API Failed with status: ${response.statusCode}");
        MyToast.showCustom(" Data Added Failed");
      }
    } catch (e) {
      dailyEntryAddlist.clear();
      print("⚠️ Exception: $e");
      MyToast.showCustom("Something went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }



  var dailyEntryNozzlelist = [];


  dailyEntryNozzle() async {
    try {
      dailyEntryNozzlelist.clear();
      var token = await mySharedPref().getData("token");

      final url = "${MyApis.dailyentrynozzlelist}?branch_id=${'1'}";


      var response = await http.get(Uri.parse(url),headers: {
        'x-api-key': '$token',
      });
      final jsonData = jsonDecode(response.body);
      print('datassssss1233232333:${response.body}');



      if (response.statusCode == 200) {
        dailyEntryNozzlelist.assignAll(jsonData['data']);

        

      } else {
        dailyEntryNozzlelist.clear();
        print("Api Failed");
      }
    } catch (e) {
      dailyEntryNozzlelist.clear();
      print("Somthing went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }




}
