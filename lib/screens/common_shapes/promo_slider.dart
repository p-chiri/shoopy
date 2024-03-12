import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/authentication/controllers_onboarding/home_controller.dart';
import 'package:rentit/screens/common_shapes/slider_container.dart';

import '../../helpers.dart';
import 'common_container.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),

          ),
          items: banners.map((url) =>  TRoundedImage(imageUrl: url, isNetworkImage: false, borderRaduis: TSizes.sm)).toList()

            
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
    () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i< banners.length; i++)  TCircularcontainer(width: 20, height: 4, margin: const EdgeInsets.only(right: 10), backgroundColor: controller.carouselCurrentIndex.value == i ? Colors.blue : Colors.grey,)

              ],
            ),
          ),
        )
      ],
    );
  }
}
