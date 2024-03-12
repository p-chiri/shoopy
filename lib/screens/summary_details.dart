import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/pages/LoanCalculator/LoanHomePage.dart';

class LoanSummaryScreen extends StatelessWidget {
  const LoanSummaryScreen({super.key});

  double calculateLoanEligibility(int age, double monthlyIncome) {
    if (age < 20) {
      // Do not award a loan for customers below 20 years old
      return 0.0;
    }

    // Business rules for loan eligibility calculation
    double baseLoanAmount = 1000; // Some base amount
    double ageFactor = 10; // Example: $10 per year of age
    double incomeFactor = 0.2; // Example: 20% of monthly income

    // Calculate loan eligibility based on age and income
    double ageContribution = age * ageFactor;
    double incomeContribution = monthlyIncome * incomeFactor;

    double totalEligibility = baseLoanAmount + ageContribution + incomeContribution;

    // You may want to add additional checks or constraints based on your business rules

    return totalEligibility;
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16),
              Text("Processing your loan..."),
            ],
          ),
        );
      },
    );
  }

  void showLoanConfirmationDialog(BuildContext context, double loanAmount) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Loan Application successfull"),
          content: Text("Congratulations! Your loan of KSH $loanAmount was Successfull pending Approval."),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pop();
                  Get.to(LoanHomePage(Balance: loanAmount, cardNumber: 12, expiryMonth: 2027, expiryYear: 2030));// Close the dialog
                },
                child: const Text("Okay"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = Get.arguments as Map<String, dynamic>?;

    if (args != null) {
      Map<String, dynamic>? details = args['details'];
      // Extract age and monthly income
      int age = details?['personalDetails']['age'];
      double monthlyIncome = details?['financialDetails']['income'];

      // Calculate loan eligibility
      double eligibleLoanAmount = calculateLoanEligibility(age, monthlyIncome);

      return Scaffold(
        appBar: AppBar(
          title: const Text("Loan Summary"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Text(
                      "Personal Details",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Full Name: ${details?['personalDetails']?['fullName'] ?? "N/A"}'),
                          Text('Date of Birth: ${details?['personalDetails']?['dateOfBirth'] ?? "N/A"}'),
                          Text('Phone Number: ${details?['personalDetails']?['phoneNumber'] ?? "N/A"}'),
                          Text('Email Address: ${details?['personalDetails']?['emailAddress'] ?? "N/A"}'),
                          Text('Next of Kin Name: ${details?['personalDetails']?['guarantorName'] ?? "N/A"}'),
                          Text('Next of Kin Phone: ${details?['personalDetails']?['guarantorPhone'] ?? "N/A"}'),
                          Text('Next of Kin Relation: ${details?['personalDetails']?['relation'] ?? "N/A"}'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16.0),
                    Text(
                      "Financial Details",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Received Monthly Income: ${details?['financialDetails']?['income'] ?? "N/A"}'),
                        Text('Received employment: ${details?['financialDetails']?['employmentTitle'] ?? "N/A"}'),
                        Text('Received employment: ${details?['financialDetails']?['employmentStatus'] ?? "N/A"}'),
                        Text('Received Account Number: ${details?['financialDetails']?['accountNumber'] ?? "N/A"}'),
                        Text('Received Bank Name: ${details?['financialDetails']?['bankName'] ?? "N/A"}'),
                        const SizedBox(height: 16.0),
                      ],
                    ),

                    Text(
                      "Loan Purpose",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text('Loan Amount Requested: ${details?['loanPurposeDetails']?['loanAmount'] ?? "N/A"}'),
                      Text('Purpose of Loan: ${details?['loanPurposeDetails']?['loanPurpose'] ?? "N/A"}'),
                      const SizedBox(height: 16.0),
                    ],),

                    Text(
                      "Loan Eligibility",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text('You are Eligible For Loan Amount: KSH${eligibleLoanAmount.toStringAsFixed(2)}'),
                  ],
                  ),

                  Expanded(
                    child: Align(
                      //alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add logic for cancel button
                              Get.to(const LoanHomePage(Balance: 0, cardNumber: 12, expiryMonth: 04, expiryYear: 2030)); // Navigate back to the previous screen
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              // Adjust padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100), // Adjust radius as needed
                              ),
                            ),
                            child: const Text('Cancel Application'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add logic for apply loan button
                              showLoadingDialog(context); // Show loading dialog
                              // Simulate a delay of 5 seconds (replace this with your actual loan processing logic)
                              Future.delayed(const Duration(seconds: 5), () {
                                Navigator.of(context, rootNavigator: true).pop(); // Close the loading dialog
                                showLoanConfirmationDialog(context, eligibleLoanAmount); // Show loan confirmation dialog
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: const Text('Apply Loan'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

      );
    }

    // Return a default widget (you can customize this part)
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loan Summary"),
      ),
      body: const Center(
        child: Text("No details available."),
      ),
    );
  }
}
