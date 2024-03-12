import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/authentication/controllers_onboarding/onboarding_controller.dart';

import '../screens/onboarding/onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return  Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: 'assets/images/fincorp.png', title: 'FinCorp Credit',
                subTittle: 'We are here to give you , wide-range of innovative and beneficial financial products targeting its diverse clientele.',
              ),
              OnBoardingPage(image: 'assets/images/goal.png', title: 'micro finance',
                subTittle: 'We are keen to enrich the lives of our customers and always go out of our way to customize our products to meet the specific needs of each of our customers',
              ),
              OnBoardingPage(image: 'assets/images/compliance.png', title: 'Shari\'ah Compliant',
                subTittle: 'It is a very young concept in mordern times yet it is emerging as one of the fastest growing areas of finace',
              ),
            ],
          ),
          const OnBoardSkip(),

          //Positioned(top: Helpers.getAppBarHeight(),child: TextButton(onPressed: (){}, child: const Text('Skip'),))
          //scrollable pages
          const OnBoardNavigation(),

          const OnBoardingNextButton()
        ],
      ),
    );
  }
}






