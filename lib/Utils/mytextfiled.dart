import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'myColors.dart';


class myCustomTextfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final IconData? iconn;
  final bool isObscure;
  final int? maxLength;
  final bool alwaysBoarder;
  final List<String>? autofillHints;
  final  bool readOnly ;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;



   myCustomTextfield({super.key,
     required this.hinttext,
     required this.textEditingController,
     this.validator,
     this.onChanged,
     this.iconn,
     this.isObscure = false,
     this.keyboardType,
     this.maxLength,
     this.autofillHints,
     this.alwaysBoarder = false,
     this.readOnly=false,
     this.inputFormatters,

   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType,
      readOnly: readOnly,
      style:  TextStyle(
          color: AppColors.navyblue, fontWeight: FontWeight.w500),
      autofillHints: autofillHints,
      controller: textEditingController,
      obscureText: isObscure,
      onChanged: onChanged,
      validator: validator,
      inputFormatters:  [
        LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
          errorStyle:  TextStyle(color: myColor.errorcolor),

          hintStyle:
           TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          hintText: hinttext,
          fillColor: Colors.white,
          filled: true,


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
              borderSide: BorderSide(color: AppColors.navyblue)),
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
