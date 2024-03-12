import 'package:flutter/material.dart';
import 'package:rentit/helpers.dart';

class ProductWishlistBtn extends StatelessWidget {
  const ProductWishlistBtn({
    super.key, this.width, this.height, this.size = TSizes.lg, required this.icon, this.color, this.backgroundColor, this.onPressed,

  });

  //final bool dark;
  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: backgroundColor !=null
              ? backgroundColor! : Helpers.isDarkMode(context) ? Colors.black12.withOpacity(0.9) : Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)
      ),
      child: IconButton(onPressed: (){}, icon: Icon(icon)),
    );
  }
}