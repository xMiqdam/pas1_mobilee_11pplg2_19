
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobilee_11pplg2_19/controller/dashboard_controller.dart';
import 'package:pas1_mobilee_11pplg2_19/menu/favorite_menu.dart';
import 'package:pas1_mobilee_11pplg2_19/menu/home_menu.dart';
import 'package:pas1_mobilee_11pplg2_19/menu/profile_menu.dart';
import 'package:pas1_mobilee_11pplg2_19/widgets/color.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    final List<Widget> menus = [
      HomeMenu(),
      FavoriteMenu(),
      ProfileMenu()
    ];

    return Obx(() {
      return Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: menus[dashboardController.selectedindex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: grayNavColor,
          currentIndex: dashboardController.selectedindex.value,
          onTap: dashboardController.changeMenu,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: redColor,
          unselectedItemColor: whiteColor,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorit"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: "Profile"),
          ],
        ),
      );
    });
  }
}