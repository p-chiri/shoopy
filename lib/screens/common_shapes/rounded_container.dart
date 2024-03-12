import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = 16,
    this.showBorder = false,
    this.child,
    this.borderColor = Colors.blue,
    this.backgroundColor = Colors.white,
    this.padding, this.margin
  });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Widget? child;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor): null,
      ),
      child: child,
    );
  }
}
