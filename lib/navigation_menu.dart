import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/pages/LoanCalculator/LoanHomePage.dart';
import 'package:rentit/pages/loanstatus/loan_status.dart';
import 'package:rentit/personalization/settings.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = Helpers.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? Colors.black : Colors.white,
          indicatorColor: darkMode ? Colors.black.withOpacity(0.1) : Colors.white.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.bank), label: "Loans"),
            //NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),

          ],
        ),
      ),
      body: Obx (() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ const LoanHomePage(Balance: 0, cardNumber: 3422, expiryMonth: 12, expiryYear: 2030,),const LoanStatus(),const SettingsScreen(),];
}
