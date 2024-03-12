import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../helpers.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "email"),
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "email"),
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
        ],

    );
  }
}
