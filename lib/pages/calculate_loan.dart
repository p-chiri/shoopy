import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoanCalculator/LoanHomePage.dart';

//void main() => runApp(InterestCalculatorApp());

class InterestCalculatorApp extends StatelessWidget {
  const InterestCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator',
      home: InterestCalculatorScreen(),
    );
  }
}

class InterestCalculatorScreen extends StatefulWidget {
  const InterestCalculatorScreen({super.key});

  @override
  _InterestCalculatorScreenState createState() =>
      _InterestCalculatorScreenState();
}

class _InterestCalculatorScreenState extends State<InterestCalculatorScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _calculatorType = 'Reducing Balance';
  double _amount = 0;
  int _term = 0;
  double _interestRate = 0;

  double _rentals = 0;
  double _totalPaid = 0;
  double _totalInterest = 0;

  List<Map<String, dynamic>> _monthlyBreakdown = [];

  void _calculateInterest() {
    // Reset the monthly breakdown
    _monthlyBreakdown = [];

    double principal = _amount;
    double monthlyInterestRate =
        _interestRate / 100 / (_calculatorType == 'Reducing Balance' ? 12 : 1);
    double monthlyPayment = (_calculatorType == 'Fixed Principal'
        ? _amount
        : _amount *
            monthlyInterestRate /
            (1 - 1 / pow(1 + monthlyInterestRate, _term)));
    double totalPaid = 0;
    double totalInterest = 0;

    for (int i = 1; i <= _term; i++) {
      double interest = principal * monthlyInterestRate;
      double principalPaid = (_calculatorType == 'Reducing Balance'
          ? monthlyPayment - interest
          : _amount / _term);
      double balance = principal - principalPaid;

      _monthlyBreakdown.add({
        'month': i,
        'principal': principal,
        'interest': interest,
        'monthlyPayment': monthlyPayment,
        'principalPaid': principalPaid,
        'balance': balance
      });

      principal = balance;
      totalPaid += monthlyPayment;
      totalInterest += interest;
    }

    setState(() {
      _rentals = monthlyPayment;
      _totalPaid = totalPaid;
      _totalInterest = totalInterest;
    });
  }

  void _showMonthlyBreakdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => ListView.builder(
        itemCount: _monthlyBreakdown.length,
        itemBuilder: (BuildContext context, int index) {
          Map<String, dynamic> monthData = _monthlyBreakdown[index];
          return ListTile(
            title: Text('Month ${monthData['month']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Principal: ${monthData['principal']}'),
                Text('Interest: ${monthData['interest']}'),
                Text('Monthly Payment: ${monthData['monthlyPayment']}'),
                Text('Principal Paid: ${monthData['principalPaid']}'),
                Text('Balance: ${monthData['balance']}'),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
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
      //backgr
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   title: Text('Interest Calculator'),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text('Calculator Type'),
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField<String>(
                  value: _calculatorType,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:
                            BorderSide(color: Colors.grey.shade600, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _calculatorType = value!;
                    });
                  },
                  items: <String>[
                    'Reducing Balance',
                    'Amortizable',
                    'Straight Line',
                    'Fixed Principal'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a calculator type';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text('Loan Amount'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField<double>(
                      value: _amount,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide(
                                color: Colors.grey.shade600, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (double? value) {
                        setState(() {
                          _amount = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text(''),
                        ),
                        DropdownMenuItem(
                          value: 5000,
                          child: Text('5000'),
                        ),
                        DropdownMenuItem(
                          value: 10000,
                          child: Text('10,000'),
                        ),
                        DropdownMenuItem(
                          value: 15000,
                          child: Text('15,000'),
                        ),
                        DropdownMenuItem(
                          value: 20000,
                          child: Text('20,000'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an amount';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text('Interest Rate (per annum))'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField<double>(
                      value: _interestRate,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide(
                                color: Colors.grey.shade600, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (double? value) {
                        setState(() {
                          _interestRate = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0.0,
                          child: Text('0'),
                        ),
                        DropdownMenuItem(
                          value: 5.0,
                          child: Text('5%'),
                        ),
                        DropdownMenuItem(
                          value: 10.0,
                          child: Text('10%'),
                        ),
                        DropdownMenuItem(
                          value: 15.0,
                          child: Text('15%'),
                        ),
                        DropdownMenuItem(
                          value: 20.0,
                          child: Text('20%'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select an interest rate';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text('Term (in months)'),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField<int>(
                      value: _term,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide(
                                color: Colors.grey.shade600, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide:
                                BorderSide(color: Colors.grey.shade600)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (int? value) {
                        setState(() {
                          _term = value!;
                        });
                      },
                      items: const [
                        DropdownMenuItem(
                          value: 0,
                          child: Text('0'),
                        ),
                        DropdownMenuItem(
                          value: 5,
                          child: Text('5'),
                        ),
                        DropdownMenuItem(
                          value: 10,
                          child: Text('10'),
                        ),
                        DropdownMenuItem(
                          value: 15,
                          child: Text('15'),
                        ),
                        DropdownMenuItem(
                          value: 20,
                          child: Text('20'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a term';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20.0),
                      backgroundColor: Colors.grey.shade900,
                      shape: const StadiumBorder()),
                  child: const Text('Calculate'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _calculateInterest();
                    }
                  },
                ),
                const SizedBox(height: 16),
                _rentals > 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Monthly Rental: $_rentals'),
                          Text('Total Paid: $_totalPaid'),
                          Text('Total Interest: $_totalInterest'),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0, vertical: 20.0),
                                backgroundColor: Colors.grey.shade900,
                                shape: const StadiumBorder()),
                            child: const Text('Monthly Breakdown'),
                            onPressed: () {
                              _showMonthlyBreakdown(context);
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
