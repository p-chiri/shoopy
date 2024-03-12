import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/pages/reset_password.dart';

import '../helpers.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password ?",style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: TSizes.spaceBtwItems,),
            Text("To enable you to reset you password please fill in the details below and then submit for review",style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections * 2,),

            TextFormField(
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Iconsax.direct_right),


              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(

                onPressed: () => Get.off(() => const ResetPasswordScreen()),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 20.0), // Adjust the padding as needed
                  ),
                ),
                child: const Text("Submit", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
