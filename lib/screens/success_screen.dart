import 'package:flutter/material.dart';

import '../helpers.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.onPressed});
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(image: const AssetImage("assets/images/sammy-line-man.png"), width: Helpers.screenWidth()* 0.6,),
                const SizedBox(height: TSizes.spaceBtwSections),

                const Text("Your Account Was Created ", style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.bold, fontSize: 19)/*Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center*/,),
                const Text("Successfully ", style: TextStyle(fontFamily: "Roboto",fontWeight: FontWeight.bold, fontSize: 19)/*Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center*/,),
                const SizedBox(height: TSizes.spaceBtwItems),
                Text("congratulations! your account awaits. Please verify you email to continue to shop with us ", style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
                const SizedBox(height: TSizes.spaceBtwSections),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onPressed,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
