import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/pages/header_page.dart';
import 'package:rentit/pages/login_page.dart';
import 'package:rentit/screens/common_shapes/appbar.dart';
import 'package:rentit/screens/common_shapes/categories_heading.dart';
import 'package:rentit/utils/settings_menu_tile.dart';

import '../data/repositories/authentication/authentication_repository.dart';
import '../utils/user_tile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const THeaderScreen(
                child: Column(
                  children: [
                    TAppBar(title: Text("Account"),),


                    TUserTile(),
                    SizedBox(height: 20,),

                  ],
                )
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const THeadingSection(title: "Account Settings", showActionButton: false,),
                  const SizedBox(height: 12,),
                  TsettingsMenuTile(icon: Iconsax.safe_home, title: "My adress", subtitle: "Set Your Location", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.bank, title: "My Account", subtitle: "Update My account", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.call, title: "Phone Number", subtitle: "Update My Phone Number", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.sms, title: "My Email", subtitle: "Update My Email", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.safe_home, title: "Notifications", subtitle: "Configure My notifications", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.security_card, title: "Account Privacy", subtitle: "Manage my Data usage and accounts", onTap: (){},),

                  const SizedBox(height: 24,),
                  const THeadingSection(title: "App Settings", showActionButton: false,),
                  const SizedBox(height: 12,),
                  TsettingsMenuTile(icon: Iconsax.document_upload, title: "Upload Documents", subtitle: "Update My documents", onTap: (){},),
                  TsettingsMenuTile(icon: Iconsax.location, title: "Location", subtitle: "Turn On my live location", onTap: (){},trailing: Switch(value: true, onChanged: (value){},activeColor: Colors.green,),),
                  TsettingsMenuTile(icon: Iconsax.security_user, title: "Safe Mode", subtitle: "Turn on Safe Mode", onTap: (){},trailing: Switch(value: true, onChanged: (value){},activeColor: Colors.green,),),
                  TsettingsMenuTile(icon: Iconsax.image, title: "Image Quality", subtitle: "Upload Quality Images", onTap: (){},trailing: Switch(value: true, onChanged: (value){},activeColor: Colors.green,),),

                  const SizedBox(height: 24,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    try {
                      await AuthenticationRepository.instance.logout();
                    } catch (e) {
                      // Handle any errors that may occur during logout
                      print("Error during logout: $e");
                    }
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(color: Colors.green),
                    ),
                  ),
                  child: const Text("Logout"),
                ),
              ),

              const SizedBox(height: 24,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


