import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';

class Mydropdown extends StatelessWidget {
  final List<String> items;
  String selectedItem;
  final String hint;
  final ValueChanged<String?> onChanged;

  Mydropdown({super.key, required this.items, required this.selectedItem, required this.hint, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,

      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1), // border
        borderRadius: BorderRadius.circular(10), // rounded corners
      ),
      child: DropdownButtonHideUnderline(

        child: DropdownButton<String>(
          dropdownColor: AppColors.whiteBg,
          hint: Text(hint),
          value: selectedItem.isEmpty ? null : selectedItem,
          items: items.map((item) => DropdownMenuItem(child: Text(item), value: item)).toList(),
          onChanged:onChanged,
        ),
      ),
    );
  }
}
