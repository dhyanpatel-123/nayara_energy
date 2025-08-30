import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class MyCustomDateFromTo extends StatelessWidget {
  final String? title;

  MyCustomDateFromTo({super.key,  this.title});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (da){
        // final displayDate = date.selectedDate ?? DateTime.now();
        // final FromDate = date.selectedDateFrom ;
        // final ToDate = date.selectedDateTo ;
        return SizedBox();

        // final formattedDateFrom = FromDate != null
        //     ? DateFormat('EEE - dd').format(FromDate)
        //     : "From Date";
        //
        // final formattedDateTo = ToDate != null
        //     ? DateFormat('EEE - dd').format(ToDate)
        //     : "To Date";
        //
        // return Container(
        //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: Colors.grey),
        //     borderRadius: BorderRadius.circular(6),
        //   ),
        //   child: Row(
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           date.pickDateFrom(context);
        //         },
        //         child: Row(
        //           children: [
        //             DataText(text: formattedDateFrom, fontSize: 15),
        //             const SizedBox(width: 8),
        //             const Icon(Icons.calendar_today, size: 16),
        //           ],
        //         ),
        //       ),
        //       const SizedBox(width: 10),
        //       GestureDetector(
        //         onTap: () {
        //           date.pickDateTo(context);
        //         },
        //         child: Row(
        //           children: [
        //             DataText(text: formattedDateTo, fontSize: 15),
        //             const SizedBox(width: 8),
        //             const Icon(Icons.calendar_today, size: 16),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // );


      },

    );
  }
}
