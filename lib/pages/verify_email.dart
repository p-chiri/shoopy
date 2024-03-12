import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/authentication/signup/verification_controller.dart';

import '../data/repositories/authentication/authentication_repository.dart';
import '../helpers.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout, icon: const Icon(CupertinoIcons.clear))
        ]
      ),
      body:  SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(image: const AssetImage("assets/images/sammy-line-verification.png"), width: Helpers.screenWidth()* 0.6,),
              const SizedBox(height: TSizes.spaceBtwSections),

              const Text("Verify Your Email Address", style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.bold, fontSize: 19)/*Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center*/,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text("congratulations! your account awaits. Please verify you email to continue to shop with us ", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: TSizes.spaceBtwSections),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
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
                  child: const Text("Continue", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
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
