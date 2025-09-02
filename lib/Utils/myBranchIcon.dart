import 'package:flutter/material.dart';

class myBranchIcon extends StatelessWidget {

   final VoidCallback  onTap;
   final String ImagePath;

   myBranchIcon({super.key, required this.onTap,required this.ImagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,

      child: IconButton(onPressed:onTap , icon:Image.asset(ImagePath),

      ),
    );
  }
}
