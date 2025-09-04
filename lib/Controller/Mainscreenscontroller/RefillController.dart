import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myshared.dart';
import 'package:nayara_energy_app/myApis/Myapis.dart';
import 'package:http/http.dart' as http;

class RefillController extends  GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    isLoading = true;
    init();
  }

  init(){
    dailyEntryRefillList();
  }


  TextEditingController SupplierEditingController= TextEditingController();
  TextEditingController RefilledEditingController= TextEditingController();



  bool isLoading = false;

  var dailyEntryRefilllist = [];
  dailyEntryRefillList() async {
    try {
      dailyEntryRefilllist.clear();
      var token = await mySharedPref().getData("token");
      print("${token}");

      final url = "${MyApis.dailyrefillentrylist}?branch_id=${'2'}";


      var response = await http.get(Uri.parse(url),headers: {
        'x-api-key': '$token',
      });
      final jsonData = jsonDecode(response.body);
      print('datassssss1233:${response.body}');
      if (response.statusCode == 200) {
        dailyEntryRefilllist.assignAll(jsonData['data']);
      } else {
        dailyEntryRefilllist.clear();
        print("Api Failed");
      }
    } catch (e) {
      dailyEntryRefilllist.clear();
      print("Somthing went Wrong");
    } finally {
      isLoading = false;
      update();
    }
  }

}