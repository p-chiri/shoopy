
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import 'LoanHomePage.dart';

class LoanApplication extends StatefulWidget {
  const LoanApplication({Key? key}) : super(key: key);

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  int _accountNumber = 0;
  int _loanTerm = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loan Status'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate to the homepage
              // You may replace 'HomePage' with the actual class or route for your homepage
              //Navigator.of(context).pushReplacementNamed('LoanHomePage');
              Get.to(const LoanHomePage(Balance: 4500, cardNumber: 123456789, expiryMonth: 10, expiryYear: 2030,));
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Show notifications screen
              },
            ),
          ],
        ),
        //backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Apply your loan',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text('Loan amount'),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'amount',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text('Guarantor'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownButtonFormField<int>(
                      value: _accountNumber,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Colors.grey.shade600, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      onChanged: (int? value) {
                        setState(() {
                          _accountNumber = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text(' '),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('Arnold Mutai'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('Cynthia obachi'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('derrick otieno'),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text('Chepchumba agnes'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an Gurantor account number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14.0),
                      child: Text('term'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DropdownButtonFormField<int>(
                      value: _loanTerm,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: Colors.grey.shade600, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      onChanged: (int? value) {
                        setState(() {
                          _loanTerm = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('0'),
                        ),
                        DropdownMenuItem(
                          value: 2,
                          child: Text('2'),
                        ),
                        DropdownMenuItem(
                          value: 4,
                          child: Text('4'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('5'),
                        ),
                        DropdownMenuItem(
                          value: 6,
                          child: Text('6'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a term ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(28),
                      topLeft: Radius.circular(28),
                    ),
                    color: Colors.grey.shade900),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Loan details',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'loan amount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$100000',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'loan amount',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$100000',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Duration',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '12 months',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Total Repayment',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '\$105000',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              title: 'Loan Application',
                              titleTextStyle: const TextStyle(fontSize: 20),
                              desc:
                                  'Your loan of 20000 was approved and will be sent to your account',
                              descTextStyle: const TextStyle(fontSize: 16),
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoanHomePage(
                                            Balance: 500000,
                                            cardNumber: 12345454,
                                            expiryMonth: 04,
                                            expiryYear: 2030)));
                              },
                            ).show();
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              backgroundColor: Colors.grey.shade200,
                              shape: const StadiumBorder()),
                          child: const Text(
                            'Request Loan',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
