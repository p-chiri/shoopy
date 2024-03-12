import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key, this.width , this.height, required this.imageUrl, this.applyImageRadius = true, this.border, this.backgroundColor = Colors.transparent, this.fit = BoxFit.contain, this.padding, required this.isNetworkImage, this.onPressed, required this.borderRaduis,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRaduis;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(borderRaduis)),
        child: ClipRRect(
            borderRadius: applyImageRadius ?  BorderRadius.circular(borderRaduis): BorderRadius.zero,
            child:  Image(image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider, fit: fit,)
        ),
      ),
    );
  }
}
