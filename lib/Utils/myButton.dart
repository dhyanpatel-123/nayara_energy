import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class myButton extends StatelessWidget {

  final String title;
  final VoidCallback onTap;
  final bool Inverted;

  const myButton({super.key, required this.onTap, required this.title,this.Inverted=false});

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return Material(
      color: Colors.transparent,
      child: GestureDetector(

        onTap: onTap,
        child: Container(
          height: mySize.height / 15,
          width: mySize.width,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.navyblue),
            color: Inverted ? AppColors.whiteBg : AppColors.navyblue,
            borderRadius: BorderRadius.circular(13),


          ),
          child: Center(
            child: DataText(
              text: title,
              fontSize: 17,
              color: Inverted ? AppColors.navyblue :AppColors.whiteBg,
              fontWeight: FontWeight.w500,
            ),
          ),

        ),
      ),
    );
  }
}


class mySmallButton extends StatelessWidget {
  const mySmallButton(
      {super.key,
        required this.title,
        required this.onTap,
        this.inverted = false});

  final String title;
  final VoidCallback onTap;
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    var mySize = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.navyblue),
            color: inverted ? AppColors.whiteBg: AppColors.navyblue,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: DataText(
            text: title,fontWeight: FontWeight.w600,
            fontSize: 15,
            color: inverted?AppColors.darkGreen:Colors.white,
          ),
        ),
      ),
    );
  }
}
