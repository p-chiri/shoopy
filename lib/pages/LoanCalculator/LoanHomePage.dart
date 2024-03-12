//import 'package:rentit/pages/guarantor/guarantor_status.dart';
import 'package:rentit/pages/loanstatus/loan_status.dart';


import 'package:rentit/pages/calculate_loan.dart';
import 'package:flutter/material.dart';
import 'package:rentit/screens/common_shapes/appbar.dart';
import 'package:rentit/screens/personal_details.dart';

import '../../utils/header_page.dart';
import 'package:rentit/utils/loan_btn.dart';

class LoanHomePage extends StatelessWidget {
  final double Balance;
  final int cardNumber;
  final int expiryMonth;
  final int expiryYear;
  const LoanHomePage({
    Key? key,
    required this.Balance,
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            THeaderScreen(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TAppBar(leadingIcon: CircleAvatar(
        radius: 70,
          child: ClipOval(
            child: Image.asset(
              "assets/images/programmer.png",
              width: 60, // Set the desired width
              height: 60, // Set the desired height
              fit: BoxFit.cover, // Adjust BoxFit as needed
            ),
          ),// Adjust the radius as needed

        ), title: const Text('Hello Arnold '),),
                    const SizedBox(height: 10,)
                    /*ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      tileColor: Colors.grey.shade100,
                      leading: Icon(Icons.account_circle, size: 60, color: Colors.white,), // Replace with your desired leading icon
                      title: Text(
                        'Hello, Arnold Mutai',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
                      ),
                      trailing: Icon(Icons.notifications, color: Colors.white,), // Replace with your desired trailing icon
                    ),*/


                  ],
                )),


            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.grey.shade200,

                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Balance", style: TextStyle(
                                color: Colors.black
                            ),),
                            Image.asset("assets/images/chip.png", height: 15,)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text("KSH $Balance",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 28
                          ),),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cardNumber.toString(),style: const TextStyle(
                                color: Colors.black
                            ),),
                            Text('$expiryMonth/$expiryYear',style: const TextStyle(
                                color: Colors.black
                            ),)
                          ],)
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PersonalDetailsStepPage()));
                        },
                        child: const LoanBtn(btnText: "Request loan",
                          iconImagePath: "assets/images/debit-card.png",
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoanStatus()));
                        },
                        child: const LoanBtn(btnText: "loans status",
                          iconImagePath: "assets/images/cheque.png",
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InterestCalculatorApp()));
                        },
                        child: const LoanBtn(btnText: "loan calculator",
                          iconImagePath: "assets/images/invoice.png",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PersonalDetailsStepPage()));
                        },
                        child: const LoanBtn(btnText: "Withdraw",
                          iconImagePath: "assets/images/money-withdrawal.png",
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoanStatus()));
                        },
                        child: const LoanBtn(btnText: "Send Money",
                          iconImagePath: "assets/images/send-money.png",
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const InterestCalculatorApp()));
                        },
                        child: const LoanBtn(btnText: "Loan Repayment",
                          iconImagePath: "assets/images/pay-per-click.png",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Loan History", style: TextStyle(
                          fontSize: 20
                        ),
                        ),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.search))
                      ],
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text("Vacation"),
                    subtitle: Text("due on 12/3/2030"),
                    trailing: Icon(Icons.close,color: Colors.red,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_balance),
                    title: Text("Vacation"),
                    subtitle: Text("due on 12/3/2030"),
                    trailing: Icon(Icons.close,color: Colors.red,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_balance_wallet_outlined),
                    title: Text("Vacation"),
                    subtitle: Text("due on 12/3/2030"),
                    trailing: Icon(Icons.check,color: Colors.green,),
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_balance_wallet),
                    title: Text("Vacation"),
                    subtitle: Text("due on 12/3/2030"),
                    trailing: Icon(Icons.check,color: Colors.green,),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
