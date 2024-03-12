import 'package:flutter/material.dart';

import '../../helpers.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true, this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          width: Helpers.screenWidth(),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ?  Colors.black : Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: showBorder ? Border.all(color: Colors.grey.shade100) : null,

          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey[600],),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text(text, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}
