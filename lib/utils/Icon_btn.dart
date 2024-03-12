import 'package:flutter/material.dart';

class IconBtn extends StatelessWidget {
  final iconImagePath;
  final String btnText;
  final color;


  const IconBtn({
    Key? key,
    this.iconImagePath,
    required this.btnText,
    required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                    spreadRadius: 1
                )
              ],
              color: color,
              borderRadius: BorderRadius.circular(28)
          ),
          child: Center(child: Image.asset(iconImagePath),),),
        const SizedBox(height:10),
        Text(btnText, style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700]
        ),)
      ],
    );
  }
}
