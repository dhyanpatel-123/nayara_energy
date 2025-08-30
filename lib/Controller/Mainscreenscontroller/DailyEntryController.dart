import 'dart:convert';

import 'package:get/get.dart';
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
    dailyEntryViewList();
  }

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
  dailyEntryViewList() async {
    try {
      dailylist.clear();
      var token = await mySharedPref().getData("token");

      final url = "${MyApis.dailyentryview}?branch_id=${'1'}&id=${'1'}";


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


  var dailyEntryAddlist = [];
  dailyEntryAddList(String id) async {
    try {
      dailyEntryAddlist.clear();
      var token = await mySharedPref().getData("token");

      final url = "${MyApis.dailyentryadd}";

      var response = await http.post(Uri.parse(url),headers: {
        'x-api-key': '$token',
      },
        body: {
        'id':'id',
          'branch_id':"1",
          'fuel_type':'1',
           'tank_id':'3',
          'nozzle_id':'8',
          'entry_date':'30-08-2025',
          'test_qty':'15',
          'starting_qty':'2000',
          'end_qty':"2000",
          'final_used_qty':'15',

        },


      );
      final jsonData = jsonDecode(response.body);
      print('datassssss1233:${response.body}');
      if (response.statusCode == 200) {
        // dailyEntryAddlist.assignAll(jsonData['data']);
      } else {
        dailyEntryAddlist.clear();
        print("Api Failed");
      }
    } catch (e) {
      dailyEntryAddlist.clear();
      print("Somthing went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }



}
