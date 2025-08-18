import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class MyCustomDatePicker extends StatelessWidget {
  final String? title;
  final HomeController date = Get.put(HomeController());

  MyCustomDatePicker({super.key,  this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (da){
        final displayDate = date.selectedDate ?? DateTime.now();
        final formattedDate = DateFormat('EEE - dd').format(displayDate);

        return InkWell(
          onTap: (){
            date.pickDate(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),


            child: Row(

              children: [
                DataText(text: formattedDate, fontSize: 15),
                const SizedBox(width: 8),
                const Icon(Icons.calendar_today, size: 16),


              ],

            ),
          ),
        );

      },

    );
  }
}
