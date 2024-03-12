import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/screens/loan_purpose.dart';
import '../models/user_details.dart';

class FinancialDetailsStepPage extends StatefulWidget {
  const FinancialDetailsStepPage({super.key});

  @override
  _FinancialDetailsStepPageState createState() => _FinancialDetailsStepPageState();
}

class _FinancialDetailsStepPageState extends State<FinancialDetailsStepPage> {
  final UserDetails userDetails = Get.find<UserDetails>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables to capture details
  double income = 0.0;
  int creditScore = 0;
  String employmentStatus = '';
  String employmentTitle = '';
  String accountNumber = '';
  String bankName = '';

  Future<Map<String, dynamic>?> saveFormData() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Get data from form fields
      double income = this.income;
      int creditScore = this.creditScore;
      String employmentStatus = this.employmentStatus;
      String employmentTitle = this.employmentTitle;
      String accountNumber = this.accountNumber;
      String bankName = this.bankName;

      // Capture entered personal details

      // Capture entered financial details
      Map<String, dynamic> financialDetails = {
        'income': income,
        'creditScore': creditScore,
        'employmentStatus': employmentStatus,
        'employmentTitle': employmentTitle,
        'accountNumber': accountNumber,
        'bankName': bankName,
      };

      // Combine both personal and financial details

      return financialDetails;
    } else {
      return null;
    }
  }



  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? enteredDetails = Get.arguments as Map<String, dynamic>?;

    // Use the entered details as needed
    if (enteredDetails != null) {
      // Example: Print the entered full name
      print('Entered Full Name: ${enteredDetails['fullName']}');
      print('Entered Date of Birth: ${enteredDetails['dateOfBirth']}');
      print('Entered Phone Number: ${enteredDetails['phoneNumber']}');
      print('Entered Email Address: ${enteredDetails['emailAddress']}');
      print('Entered Next of Kin Name: ${enteredDetails['guarantorName']}');
      print('Entered Next of Kin Phone: ${enteredDetails['guarantorPhone']}');
      print('Entered Next of Kin Relation: ${enteredDetails['relation']}');
      print('Entered Next of Kin age: ${enteredDetails['age']}');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loans Application"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Financial Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      income = double.tryParse(value) ?? 0.0;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Monthly Income",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your income';
                    }
                    return null;
                  },
                ),
                Text("Income: $income"),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: employmentStatus.isNotEmpty ? employmentStatus : null, // guard it with null if empty
                  //value: employmentStatus,
                  onChanged: (value) {
                    setState(() {
                      employmentStatus = value!;
                    });
                  },
                  items: const [
                    DropdownMenuItem(

                      value: 'employed',
                      child: Text('Employed'),
                    ),
                    DropdownMenuItem(
                      value: 'unemployed',
                      child: Text('Unemployed'),
                    ),
                  ],
                  decoration: const InputDecoration(
                    labelText: "Employment Status",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your employment status';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                if (employmentStatus == 'employed')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Enter Your employment details here ", style: Theme.of(context).textTheme.bodyLarge,),
                      const SizedBox(height: 16.0),// Show text form field only if employed
                      SizedBox(
                        height: 100,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              employmentTitle = value;
                            });
                          },
                          decoration: const InputDecoration(
                            labelText: "Employment Title",
                          ),
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your employment title';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                Text("emplyment: $employmentTitle"),
                const SizedBox(height: 16.0),
                /*TextFormField(
                  onChanged: (value) {
                    setState(() {
                      creditScore = int.tryParse(value) ?? 0;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: "Credit Score",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your credit score';
                    }
                    return null;
                  },
                ),
                Text("Credit Score: ${creditScore}"),*/
                //const SizedBox(height: 16.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      accountNumber = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Account Number",
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your account number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      bankName = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Bank Name",
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your bank name';
                    }
                    return null;
                  },
                ),
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
              Map<String, dynamic>? financialDetails = await saveFormData();

              if (financialDetails != null) {
                // Merge personal and financial details
                Map<String, dynamic> allDetails = {
                  'personalDetails': Get.arguments, // Add the personal details received from the previous page
                  'financialDetails': financialDetails,
                };

                // Navigate to the next page
                Get.to(() => const LoanPurposeStepPage(), arguments: allDetails);
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
