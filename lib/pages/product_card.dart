import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/screens/common_shapes/rounded_container.dart';
import 'package:rentit/screens/common_shapes/slider_container.dart';

import '../screens/common_shapes/circular_btn.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return  Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(16),
        color: dark ? Colors.grey[600] : Colors.white
      ),
      child: Column(
        children: [
          RoundedContainer(
            height: 180,
            padding: const  EdgeInsets.all(TSizes.sm),
            backgroundColor: dark? Colors.black12 : Colors.white,
            child: Stack(
              children: [
                const TRoundedImage(imageUrl: "assets/images/sneak.jpg", isNetworkImage: false, borderRaduis: TSizes.md, applyImageRadius: true,),
                Positioned(
                  top: 12,
                  child: RoundedContainer(
                    radius: TSizes.md,
                    backgroundColor: Colors.yellow.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs,

                  ),
                    child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),),
                ),
                const Positioned(
                  right: 0,
                    top: 0,
                    child: ProductWishlistBtn(icon: Iconsax.heart5, color: Colors.red,
                    )
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}


