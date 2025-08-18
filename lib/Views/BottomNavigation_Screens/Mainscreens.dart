import 'package:flutter/material.dart';
import 'package:nayara_energy_app/Controller/BottomNavigationController.dart';
import 'package:get/get.dart';
import 'package:nayara_energy_app/Utils/myColors.dart';
import 'package:nayara_energy_app/Views/HomePages/HomeScreen.dart';
import 'package:nayara_energy_app/Views/HomePages/DailyEntryScreen.dart';
import 'package:nayara_energy_app/Views/HomePages/Profile.dart';
import 'package:nayara_energy_app/Views/HomePages/Reports.dart';

import '../HomePages/Refill Tanks.dart';

class Mainscreens extends StatelessWidget {
  Mainscreens({super.key});

  final pages = [
    HomeScreen(),
    DailyEntryScreen(),
    RefillScreen(),
    ReportScreen(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (main) {
        return Scaffold(
          body: pages[main.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: main.currentIndex,
            onTap: (index) {
              main.changeTab(index);
            },
            iconSize: 28,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.navyblue,
            showUnselectedLabels: false,

            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.black,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.file_copy_rounded), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.local_gas_station_rounded), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp), label: ''),
            ],
          ),
        );
      },
    );
  }
}
