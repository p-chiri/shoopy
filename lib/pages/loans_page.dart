import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_details.dart';
import '../screens/financial_details.dart';
import '../screens/loan_purpose.dart';
import '../screens/personal_details.dart';
import '../screens/summary_details.dart';

class LoanApplicationPage extends StatefulWidget {
  const LoanApplicationPage({super.key});

  @override
  _LoanApplicationPageState createState() => _LoanApplicationPageState();
}

class _LoanApplicationPageState extends State<LoanApplicationPage> {
  final PageController _pageController = PageController();
  final List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  final List<UserDetails> userDetailsList = [
    UserDetails(),
    UserDetails(),
    UserDetails(),
  ];

  final List<Widget> pages = [
    const PersonalDetailsStepPage(),
    const FinancialDetailsStepPage(),
    const LoanPurposeStepPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Application"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: formKeys.length,
        itemBuilder: (context, index) {
          return Form(
            key: formKeys[index],
            child: pages[index],
          );
        },
        onPageChanged: (index) {
          // Handle page change if needed
        },
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            final currentForm = formKeys[_pageController.page!.round()];
            if (currentForm.currentState!.validate()) {
              currentForm.currentState!.save();
              if (_pageController.page! < formKeys.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // All forms are filled, navigate to summary screen
                Get.to(() => const LoanSummaryScreen());
              }
            }
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
