// import 'package:flutter/material.dart';
// import 'package:nayara_energy_app/Utils/myColors.dart';
//
// class Mydropdown extends StatelessWidget {
//   final List items;
//   final dynamic selectedItem;
//   final String hint;
//   final ValueChanged onChanged;
//
//   const Mydropdown({
//     super.key,
//     required this.items,
//     required this.selectedItem,
//     required this.hint,
//     required this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       height: 40,
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey, width: 1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           dropdownColor: AppColors.whiteBg,
//           hint: Text(hint),
//           value: items.contains(selectedItem) ? selectedItem : null,
//           items: items.map((item) {
//             return DropdownMenuItem(
//               value: item,
//               child: Text(item['branch_name']), // show branch_name only
//             );
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }
//
