import 'package:flutter/material.dart';

import '../../helpers.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key, required this.image, required this.title, this.textColor = Colors.white, this.backgroundColor = Colors.white, this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = Helpers.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration:  BoxDecoration(
                  color: backgroundColor ?? (Helpers.isDarkMode(context) ? Colors.black12 : Colors.white),
                  borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover/*,color: dark ?  Colors.black : Colors.white,*/),

              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2,),
            SizedBox(width:55,
                child:
                Text(title,
                  style: Theme.of(context).textTheme.labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
            )
          ],
        ),
      ),
    );
  }
}
