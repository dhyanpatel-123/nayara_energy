import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/myDropdown.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';

class MyCustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final bool centerTitle;
  final bool wantBackButton;
  final bool wantIcon;
  final bool wantcircleAvatar;

  const MyCustomAppbar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.navyblue,
    this.centerTitle = true,
    this.wantBackButton = false,
    this.wantIcon = false,
    this.wantcircleAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100, // give enough height
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: wantBackButton
          ? IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_circle_left_outlined,
            color: AppColors.whiteBg, size: 30),
      )
          : null,
      actions: [
        if (wantIcon)
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.solidBell,
                size: 20, color: AppColors.whiteBg),
          ),
      ],


      flexibleSpace: Padding(
        padding: const EdgeInsets.only(left: 20,top: 30, right: 16), // adjust
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAvatar(assetPath: "assets/user.jpg"),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DataText(
                  text: "Hello, user",
                  fontSize: 18,
                  color: AppColors.whiteBg,
                ),
                Row(
                  children: [
                    DataText(
                      text: "Name",
                      fontSize: 18,
                      color: AppColors.whiteBg,
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        showBranchAlertDialog();
                      },
                      child: DataText(
                        text: "(Change)",
                        fontSize: 18,
                        color: AppColors.whiteBg,
                      ),
                    ),
                  ],
                ),


              ],
            ),
          ],
        ),
      ),
    );

  }

  @override
  Size get preferredSize => Size.fromHeight(
    AppBar().preferredSize.height * 1.8, // for taller appbar
  );
}
