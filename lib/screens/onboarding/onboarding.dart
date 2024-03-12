import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helpers.dart';

class OnBoardSkip extends StatelessWidget {
  const OnBoardSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: Helpers.getAppBarHeight(),
        right: 24.0, // Set right to 0.0 to align with the right edge
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child:  Text('Skip', style: Theme.of(context).textTheme.bodyLarge,),
        ),
      );

  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subTittle,
  });

  final String image, title, subTittle;
  @override
  Widget build(BuildContext context) {
    return PageView(
      children:  [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image(
                  width: Helpers.screenWidth() * 0.8,
                  height: Helpers.screenHeight() * 0.6,
                  image: AssetImage(image
                  )
              ),
              Text(title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 13,),
              Text(subTittle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OnBoardNavigation extends StatelessWidget {
  const OnBoardNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = Helpers.isDarkMode(context);
    return Positioned(
        bottom: Helpers.getBottomNavigationBarHeight() + 25,
        left: 24.0,

        child: SmoothPageIndicator(
          count: 3,
            effect: const ExpandingDotsEffect(activeDotColor: Colors.blue, dotHeight: 10),
            controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
        )
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 24.0,
        bottom: Helpers.getBottomNavigationBarHeight(),
        child: IconButton(
          style: ElevatedButton.styleFrom(elevation: 10),
          onPressed: () => OnBoardingController.instance.nextPage(),
          icon: const Icon(Iconsax.arrow_right),
          )
    );
  }
}