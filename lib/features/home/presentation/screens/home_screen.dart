import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Obx(() => Scaffold(
          body: IndexedStack(
            index: homeController.visit.value,
            children: homeController.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: homeController.items,
            currentIndex: homeController.visit.value,
            onTap: (value) => homeController.itemOntTap(value),
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.primaryColor,
            selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
            elevation: 0.0,
            backgroundColor: AppColors.backgroundColor,
          ),
        ));
  }
}
