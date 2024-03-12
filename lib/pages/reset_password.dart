import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/pages/login_page.dart';

import '../helpers.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage("assets/images/sammy-line-man.png"), width: Helpers.screenWidth()* 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections),
              Text("Password Reset Email Sent",style: Theme.of(context).textTheme.headlineLarge,),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Text("To enable you to reset you password please fill in the details below and then submit for review the details below and then submit for revie then",style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: TSizes.spaceBtwSections * 2,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginPage()),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 18.0), // Adjust the padding as needed
                      ),
                    ),
                    child: const Text("Finish", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Get.to(() => const LoginPage()),
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(vertical: 18.0), // Adjust the padding as needed
                    ),
                  ),
                  child: const Text("Resend Email", style: TextStyle(color: Colors.blue)),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
