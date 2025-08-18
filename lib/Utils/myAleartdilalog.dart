//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nayara_energy_app/Utils/mytextWidget.dart';
// import 'package:nayara_energy_app/Utils/mytextfiled.dart';
//
// void showAleartAddDailyEntry() {
//
//
//   final TextEditingController dailyEntryController = TextEditingController();
//   showDialog(
//     barrierDismissible: false,
//     context: Get.context!,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         // Native Android dialog
//         title: const Text('${}'),
//         content: myCustomTextfield(hinttext: "Please Add Start Qty here", textEditingController:dailyEntryController ),
//         actions: [
//           Row(
//             children: [
//               TextButton(
//                 child: const DataText(
//                   text: 'Okay',
//                   fontSize: 15,
//                   color: Colors.black,
//                 ),
//                 onPressed: () async {
//
//
//
//                   Get.back();
//
//                   // Get.dialog(myLoading(), barrierDismissible: false);
//                   try {
//
//                   } catch (e) {
//                     print(e.toString());
//                   }
//
//                   // Closes the dialog
//                 },
//               ),
//               TextButton(
//                 child: const DataText(
//                   text: 'Okay',
//                   fontSize: 15,
//                   color: Colors.black,
//                 ),
//                 onPressed: () async {
//
//
//
//                   Get.back();
//
//                   // Get.dialog(myLoading(), barrierDismissible: false);
//                   try {
//
//                   } catch (e) {
//                     print(e.toString());
//                   }
//
//                   // Closes the dialog
//                 },
//               ),
//             ],
//           ),
//         ],
//       );
//     },
//   );
// }