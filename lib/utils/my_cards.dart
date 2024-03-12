import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double Balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final color;


  const MyCard({
    Key? key,
    required this.Balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Balance", style: TextStyle(
                    color: Colors.white
                ),),
                Image.asset("images/chip.png", height: 15,)
              ],
            ),
            const SizedBox(height: 10,),
            Text("\$$Balance",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28
              ),),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(cardNumber.toString(),style: const TextStyle(
                  color: Colors.white
              ),),
              Text('$expiryMonth/$expiryYear',style: const TextStyle(
                  color: Colors.white
              ),)
            ],)
          ],
        ),
      ),
    );
  }
}
