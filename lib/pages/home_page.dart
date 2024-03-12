import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/screens/personal_details.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RangeValues _values = const RangeValues(500, 20000);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Helpers.screenWidth(),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Image(
                                image:
                                AssetImage("assets/images/shopping-cart.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Get First Loan ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .apply(color: Colors.white),
                              ),
                              Text(
                                "15 Mins ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .apply(color: Colors.orange),
                              ),
                              Text(
                                "First and Safe apply ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .apply(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select the Loan Amount ",
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        RangeSlider(
                          values: _values,
                          min: 500,
                          max: 20000,
                          onChanged: (RangeValues values) {
                            setState(() {
                              // Only update the maximum side of the range
                              _values = RangeValues(_values.start, values.end);
                            });
                          },
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Min Amount: ${_values.start.round()}",
                                style: Theme.of(context).textTheme.labelSmall),
                            Text("Max Amount: ${_values.end.round()}",
                                style: Theme.of(context).textTheme.labelSmall),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    const SizedBox(height: TSizes.spaceBtwItems),
                    TextFormField(
                      decoration: const InputDecoration(
                          //prefixIcon: Icon(Iconsax.direct_right),
                          labelText: "Amount"),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Settlement Amount ",
                            style: Theme.of(context).textTheme.labelSmall),
                        Text("KES 3600",
                            style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() =>  const PersonalDetailsStepPage()),
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 18.0),
                          ),
                        ),
                        child: const Text("Continue",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
