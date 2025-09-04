import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/BottomNavigationController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Controller/Mainscreenscontroller/HomeController.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Views/HomePages/HomeScreen.dart';
import 'package:nayara_energy_app/Views/HomePages/DailyEntryScreen.dart';
import 'package:nayara_energy_app/Views/HomePages/Invoices.dart';
import 'package:nayara_energy_app/Views/HomePages/Profile.dart';
import 'package:nayara_energy_app/Views/HomePages/Reports.dart';

import '../HomePages/Refill Tanks.dart';

class Mainscreens extends StatelessWidget {
  Mainscreens({super.key});

  final pages = [
    HomeScreen(),
    DailyEntryScreen(),
    RefillScreen(),
    Invoices(),
    Profile(wantBackButton: true,)
  ];

  HomeController hh = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(

      builder: (main) {
        return Scaffold(
          body: pages[main.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: main.currentIndex,
            onTap: (index) {
              main.changeTab(index);
            },
            iconSize: 28,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.navyblue,
            showUnselectedLabels: false,

            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label:'DashBoard'),
              BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label:'Daily Entry'),
              BottomNavigationBarItem(icon: Icon(Icons.local_gas_station), label:'Refill Tanks'),
              BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Invoice'),
              BottomNavigationBarItem(icon: Icon(Icons.more_vert), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
