import 'package:flutter/material.dart';

import 'myColors.dart';

class DataText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool wanttextAlign;
  final FontWeight fontWeight;
  final bool wantels;
  final bool wantItalic;
  final bool wantUnderLine;
  final bool wantCenter;
  final VoidCallback? ontap;

  const DataText({
    super.key,
    required this.text,
    required this.fontSize,
    this.wanttextAlign = false,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.navyblue,
    this.wantels = false,
    this.wantItalic = false,
    this.wantUnderLine = false,
    this.wantCenter = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ontap,
      child: Text(
        text == "" ? '--' : text,
        textAlign: wanttextAlign == true
            ? TextAlign.left
            : wantCenter == true
            ? TextAlign.center
            : null,
        style: TextStyle(
            fontStyle: wantItalic == true ? FontStyle.italic : FontStyle.normal,
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            overflow: wantels == true ? TextOverflow.ellipsis : null,
            decoration: wantUnderLine == true ? TextDecoration.underline : null),
      ),
    );
  }
}
