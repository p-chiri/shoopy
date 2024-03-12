import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rentit/navigation_menu.dart';
import 'package:rentit/screens/financial_details.dart';

import '../models/user_details.dart';
import '../pages/LoanCalculator/LoanHomePage.dart';

class PersonalDetailsStepPage extends StatefulWidget {
  const PersonalDetailsStepPage({super.key});

  @override
  _PersonalDetailsStepPageState createState() => _PersonalDetailsStepPageState();
}

class _PersonalDetailsStepPageState extends State<PersonalDetailsStepPage> {
  final UserDetails userDetails = Get.find<UserDetails>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  int? _age;
  String fullname = "";
  String email = "";
  String phoneNumber = "";
  String guarantorName = "";
  String Relation = "";
  String guarantorPhone = "";
  late DateTime dob;

  Future<Map<String, dynamic>?> saveFormData() async {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      // Capture entered details
      Map<String, dynamic> enteredDetails = {
        'fullName': fullname,
        'dateOfBirth': dob,
        'phoneNumber': phoneNumber,
        'emailAddress': email,
        'guarantorName': guarantorName,
        'guarantorPhone': guarantorPhone,
        'relation': Relation,
        'age': _age,
      };

      return enteredDetails;
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fullname = "";
      dob = DateTime.now();
      email = "";
      Relation = "";
      guarantorName = "";
      phoneNumber = "";
      guarantorPhone = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loan Application'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate to the homepage
              // You may replace 'HomePage' with the actual class or route for your homepage
              //Navigator.of(context).pushReplacementNamed('LoanHomePage');
              Get.to(const NavigationMenu());
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal Details",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        fullname = value;

                      });
                      print("this is the test:$fullname");
                    },
                    decoration: const InputDecoration(
                      labelText: "Full Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      fullname = value ?? '';
                    },
                  ),
                  // Text(
                  //   'Entered Full Name: ${fullname}',
                  //   style: TextStyle(fontSize: 16.0),
                  // ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _dobController,
                    decoration: const InputDecoration(
                      labelText: "Date of Birth",
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your date of birth';
                      }
                      return null;
                    },
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null && pickedDate != DateTime.now()) {
                        _dobController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          _age = _calculateAge(pickedDate);
                        });
                      }
                    },
                    onSaved: (value) {
                      dob = DateFormat('yyyy-MM-dd').parse(value ?? '');
                    },
                  ),
                  Text(
                    _age != null ? "Entered Age: $_age years" : "",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        phoneNumber = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phoneNumber = value ?? '';
                    },
                  ),
                  // Text(
                  //   'Entered Phone Number: ${phoneNumber}',
                  //   style: TextStyle(fontSize: 16.0),
                  // ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Email Address",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value ?? '';
                    },
                  ),
                  // Text(
                  //   'Entered Email Address: ${email}',
                  //   style: TextStyle(fontSize: 16.0),
                  // ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        guarantorName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Next of Kin Name",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Next of Kin Name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      guarantorName = value ?? '';
                    },
                  ),
                  /*Text(
                    'Entered Next of Kin Name: ${guarantorName}',
                    style: TextStyle(fontSize: 16.0),
                  ),*/
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        guarantorPhone = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Next of Kin Phone",
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Next of Kin Phone';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      guarantorPhone = value ?? '';
                    },
                  ),
                  // Text(
                  //   'Entered Next of Kin Phone: ${guarantorPhone}',
                  //   style: TextStyle(fontSize: 16.0),
                  // ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        Relation = value;
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Next of Kin Relation",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Next of Kin Relation';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      Relation = value ?? '';
                    },
                  ),
                  /*Text(
                    'Entered Next of Kin Relation: ${Relation}',
                    style: TextStyle(fontSize: 16.0),
                  ),*/
                  const SizedBox(height: 16.0),

                  // Add the "Next" button at the bottom
                  /*ElevatedButton(
                    onPressed: () async {
                      // Add any logic needed before navigating to the next page
                      Map<String, dynamic>? enteredDetails = (await saveFormData()) as Map<String, dynamic>?;
                      if (enteredDetails != null) {
                        // Navigate to the next page with entered details as arguments
                        Get.to(() => FinancialDetailsStepPage(), arguments: enteredDetails);
                      }
                    },
                    child: Text('Next'),
                  ),*/
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Add any other bottom navigation items here if needed

              // Your ElevatedButton wrapped in a SizedBox to add some spacing
              const SizedBox(width: 8), // Adjust spacing as needed
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    // Add any logic needed before navigating to the next page
                    Map<String, dynamic>? enteredDetails = (await saveFormData());
                    if (enteredDetails != null) {
                      // Navigate to the next page with entered details as arguments
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FinancialDetailsStepPage(),
                          settings: RouteSettings(arguments: enteredDetails),
                        ),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              ),
              const SizedBox(width: 8), // Adjust spacing as needed

              // Add any other bottom navigation items here if needed
            ],
          ),
        ),

      ),

    );
  }

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
  }
}
