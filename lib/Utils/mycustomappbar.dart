import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myAleartdilalog.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Utils/myCustomAvatar.dart';
import 'package:nayara_energy_app/Utils/myDropdown.dart';
import 'package:nayara_energy_app/Utils/mytextWidget.dart';
import 'package:nayara_energy_app/Views/HomePages/Profile.dart';

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
    this.backgroundColor = AppColors.whiteBg,
    this.centerTitle = true,
    this.wantBackButton = false,
    this.wantIcon = false,
    this.wantcircleAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,

      // if wantBackButton true → show back button
      leading: wantBackButton
          ? IconButton(
        onPressed: () => Get.back(),
        icon: Icon(Icons.arrow_circle_left_outlined,
            color: AppColors.navyblue, size: 30),
      )
          : null,

      // notification icon
      actions: [
        if (wantIcon)
          Padding(
            padding: EdgeInsets.only(top: 10,right: 20),
            child:  GestureDetector(
              onTap: (){},
              child: Icon(FontAwesomeIcons.solidBell,
                  size: 20, color: AppColors.navyblue),
            ),
          ),
      ],

      // if back button is there → show normal title
      // else show avatar + user details
      title: wantBackButton
          ? Text(
        title,
        style: TextStyle(
          color: AppColors.navyblue,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      )
          : null,

      centerTitle: wantBackButton ? centerTitle : false,

      flexibleSpace: !wantBackButton
          ? Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Get.to(()=>Profile(wantBackButton: false));
              },
                child: CustomAvatar(assetPath: "assets/user.jpg")),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DataText(
                    text: "Hello, user",
                    fontSize: 17,
                    color: AppColors.navyblue,
                  ),
                  Row(
                    children: [
                      DataText(
                        text: "Syamal",
                        fontSize: 13,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          showBranchAlertDialog();
                        },
                        child: DataText(
                          text: "(Change)",
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
          : null,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(AppBar().preferredSize.height * 1.2);
}
