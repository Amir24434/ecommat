import 'package:ecommat/controller/dashboard_controller.dart';
import 'package:ecommat/theme/theme/theme/constants/colors.dart';
import 'package:ecommat/view/Home/home.dart';
import 'package:ecommat/view/category/category_screen.dart';
import 'package:ecommat/view/my_account/my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cont = Get.put(DashBoardController());
    return GetBuilder<DashBoardController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: cont.tabIndex,
            children: const [
              HomeScreen(),
              CategoryScreen(),
              MyAccountScreen(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: SnakeNavigationBar.color(
            behaviour: SnakeBarBehaviour.floating,
            snakeShape: SnakeShape.circle,
            padding: const EdgeInsets.symmetric(vertical: 5),
            unselectedLabelStyle: const TextStyle(fontSize: 11),
            snakeViewColor: OrderitColors.green,
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            showUnselectedLabels: true,
            currentIndex: cont.tabIndex,
            onTap: (val) {
              cont.updateIndex(val);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_rounded), label: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
