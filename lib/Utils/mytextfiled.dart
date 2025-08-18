import 'package:flutter/material.dart';

import 'myColors.dart';


class myCustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? iconn;
  final bool isObscure;
  final bool alwaysBoarder;
  final List<String>? autofillHints;


   myCustomTextfield({super.key,
     required this.hinttext,
     required this.textEditingController,
     this.validator,
     this.onChanged,
     this.iconn,
     this.isObscure = false,
     this.autofillHints,
     this.alwaysBoarder = false

   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style:  TextStyle(
          color: AppColors.navyblue, fontWeight: FontWeight.w600),
      autofillHints: autofillHints,
      controller: textEditingController,
      obscureText: isObscure,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          errorStyle:  TextStyle(color: AppColors.navyblue),

          hintStyle:
           TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          hintText: hinttext,
          fillColor: Colors.white,
          filled: true,
          // prefixIcon: Icon(
          //   iconn,
          //   color: Colors.grey,
          // ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: alwaysBoarder?OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColors.navyblue)):OutlineInputBorder(

              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.navyblue)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColors.navyblue)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:  BorderSide(color: AppColors.navyblue)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none)),
    );
  }
}
