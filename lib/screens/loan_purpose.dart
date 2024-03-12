import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_details.dart';
import 'Photo_capture.dart';

class LoanPurposeStepPage extends StatefulWidget {
  const LoanPurposeStepPage({super.key});

  @override
  _LoanPurposeStepPageState createState() => _LoanPurposeStepPageState();
}

class _LoanPurposeStepPageState extends State<LoanPurposeStepPage> {
  final UserDetails userDetails = Get.find<UserDetails>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables for TextFormFields
  double loanAmount = 0.0;
  String loanPurpose = "";
  int loanTenure = 12; // Default loan tenure in months

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? allDetails = Get.arguments as Map<String, dynamic>?;

    // Declare variables outside the if block
    Map<String, dynamic>? personalDetails;
    Map<String, dynamic>? financialDetails;

    // Use the details as needed
    if (allDetails != null) {
      // Extract personal details
      personalDetails = allDetails['personalDetails'];
      if (personalDetails != null) {
        print('Entered Full Name: ${personalDetails['fullName']}');
        print('Entered Date of Birth: ${personalDetails['dateOfBirth']}');
        print('Entered Phone Number: ${personalDetails['phoneNumber']}');
        print('Entered Email Address: ${personalDetails['emailAddress']}');
        print('Entered Next of Kin Name: ${personalDetails['guarantorName']}');
        print('Entered Next of Kin Phone: ${personalDetails['guarantorPhone']}');
        print('Entered Next of Kin Relation: ${personalDetails['relation']}');
      }

      // Extract financial details
      financialDetails = allDetails['financialDetails'];
      if (financialDetails != null) {
        print('Received Monthly Income: ${financialDetails['income']}');
        print('Received Employment Status: ${financialDetails['employment']}');
        print('Received Account Number: ${financialDetails['accountNumber']}');
        print('Received Bank Name: ${financialDetails['bankName']}');
      }
    }

    // List of available loan tenures
    List<int> loanTenures = [6, 12, 24, 36];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Loan Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Loan Amount ",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the loan amount requested';
                    }
                    // You can add more specific validation based on your requirements
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      loanAmount = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                //Text("Loan Amount: $loanAmount"),
                const SizedBox(height: 16.0),
                Text("What would you like to do with the loan ?", style: Theme.of(context).textTheme.bodyLarge,),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Purpose of Loan",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the purpose of the loan';
                    }
                    // You can add more specific validation based on your requirements
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      loanPurpose = value;
                    });
                  },
                ),
                //Text("Loan Purpose: $loanPurpose"),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: "Loan Tenure",
                  ),
                  value: loanTenure,
                  items: loanTenures.map((tenure) {
                    return DropdownMenuItem(
                      value: tenure,
                      child: Text("$tenure months"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      loanTenure = value ?? 12;
                    });
                  },
                ),
                //Text("Loan Tenure: $loanTenure months"),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ElevatedButton(
            onPressed: () async {
              // Add any logic needed before navigating to the next page
              if (_formKey.currentState?.validate() ?? false) {
                // Update userDetails with the entered loan details
                userDetails.loanAmount = loanAmount;
                userDetails.loanPurpose = loanPurpose;
                 loanTenure;

                // Combine personal details, financial details, and loan purpose into a single map
                Map<String, dynamic> allDetails = {
                  'personalDetails': personalDetails,
                  'financialDetails': financialDetails,
                  'loanPurposeDetails': {
                    'loanAmount': userDetails.loanAmount,
                    'loanPurpose': userDetails.loanPurpose,
                    'loanTenure': loanTenure,
                  },
                };

                // Navigate to the next page
                Get.to(() => const PhotoCaptureStepPage(), arguments: allDetails);
              }
            },
            child: const Text('Next'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
