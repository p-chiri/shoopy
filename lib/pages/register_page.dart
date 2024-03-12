import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/authentication/signup/signup_controller.dart';

import '../helpers.dart';
import '../values/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text("Let Us Create Your Account", style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Form(
                key: controller.signupFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.firstName,
                            expands: false,
                            decoration: const InputDecoration(labelText: "first name", prefixIcon: Icon(Iconsax.user)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems,),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            expands: false,
                            decoration: const InputDecoration(labelText: "last name", prefixIcon: Icon(Iconsax.user)),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: controller.username,
                      expands: false,
                      decoration: const InputDecoration(labelText: "user name", prefixIcon: Icon(Iconsax.user_edit)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: controller.email,
                      expands: false,
                      decoration: const InputDecoration(labelText: "email", prefixIcon: Icon(Iconsax.direct)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        // Example email regex check
                        /*final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Invalid email format';
                        }*/

                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    TextFormField(
                      controller: controller.phoneNumber,
                      expands: false,
                      decoration: const InputDecoration(labelText: "phone no", prefixIcon: Icon(Iconsax.call)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // You might want to add additional phone number validation logic here
                        return null;
                      },
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        obscureText: controller.hidePassword.value,
                        expands: false,
                        decoration: InputDecoration(
                            labelText: "password",
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: IconButton(
                                onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          // You might want to add additional password validation logic here
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems,),
                    Row(
                      children: [
                        SizedBox(width:24, height:24, child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value))),
                        const SizedBox(width: TSizes.spaceBtwItems,),
                        Text.rich(TextSpan(
                            children: [
                              TextSpan(text: '${"I agree to "} ',style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: 'privacy policy ',style: Theme.of(context).textTheme.bodyMedium),
                              TextSpan(text: 'and ',style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: 'Terms of Use',style: Theme.of(context).textTheme.bodyMedium),
                            ]
                        ))
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.signupFormKey.currentState?.validate() ?? false) {
                            // Form is valid, perform signup logic here
                            controller.signup();
                          }
                        },

                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 18.0),
                          ),
                        ),
                        child: const Text("Create Account", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections, ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Divider(color: AppColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
                        Text("Or sign up with"),
                        Flexible(child: Divider(color: AppColors.grey, thickness: 0.5, indent: 5, endIndent: 60,)),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                          child: IconButton(
                            onPressed: (){},
                            icon: const Image(
                                width: 20,
                                height: 20,
                                image: AssetImage("assets/images/search.png")
                            ),
                          ),
                        ),
                      ],
                    )
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



























//import 'package:flutter/material.dart';

//import '../components/app_text_form_field.dart';
//import '../utils/extensions.dart';
//import '../values/app_colors.dart';
//import '../values/app_constants.dart';

/*class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // FocusNode confirmFocusNode = FocusNode();

  bool isObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: size.height * 0.24,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.lightBlue,
                    AppColors.blue,
                    AppColors.darkBlue,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Register',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Create your account',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppTextFormField(
                    labelText: 'Name',
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Name '
                          : value.length < 4
                          ? 'Invalid Name'
                          : null;
                    },
                    controller: nameController,
                  ),
                  AppTextFormField(
                    labelText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Email Address'
                          : AppConstants.emailRegex.hasMatch(value)
                          ? null
                          : 'Invalid Email Address';
                    },
                    controller: emailController,
                  ),
                  AppTextFormField(
                    labelText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    onChanged: (_) => _formKey.currentState?.validate(),
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Enter Password'
                          : AppConstants.passwordRegex.hasMatch(value)
                          ? null
                          : 'Invalid Password';
                    },
                    controller: passwordController,
                    obscureText: isObscure,
                    // onEditingComplete: () {
                    //   FocusScope.of(context).unfocus();
                    //   FocusScope.of(context).requestFocus(confirmFocusNode);
                    // },
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Focus(
                        /// If false,
                        ///
                        /// disable focus for all of this node's descendants
                        descendantsAreFocusable: false,

                        /// If false,
                        ///
                        /// make this widget's descendants un-traversable.
                        // descendantsAreTraversable: false,
                        child: IconButton(
                          onPressed: () => setState(() {
                            isObscure = !isObscure;
                          }),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(48, 48),
                            ),
                          ),
                          icon: Icon(
                            isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppTextFormField(
                    labelText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    // focusNode: confirmFocusNode,
                    onChanged: (value) {
                      _formKey.currentState?.validate();
                    },
                    validator: (value) {
                      return value!.isEmpty
                          ? 'Please, Re-Enter Password'
                          : AppConstants.passwordRegex.hasMatch(value)
                          ? passwordController.text ==
                          confirmPasswordController.text
                          ? null
                          : 'Password not matched!'
                          : 'Invalid Password!';
                    },
                    controller: confirmPasswordController,
                    obscureText: isConfirmPasswordObscure,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Focus(
                        /// If false,
                        ///
                        /// disable focus for all of this node's descendants.
                        descendantsAreFocusable: false,

                        /// If false,
                        ///
                        /// make this widget's descendants un-traversable.
                        // descendantsAreTraversable: false,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordObscure =
                              !isConfirmPasswordObscure;
                            });
                          },
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                              const Size(48, 48),
                            ),
                          ),
                          icon: Icon(
                            isConfirmPasswordObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: _formKey.currentState?.validate() ?? false
                        ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration Complete!'),
                        ),
                      );
                      nameController.clear();
                      emailController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
                    }
                        : null,
                    style: const ButtonStyle().copyWith(
                      backgroundColor: MaterialStateProperty.all(
                        _formKey.currentState?.validate() ?? false
                            ? null
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I have an account?',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: Theme.of(context).textButtonTheme.style,
                    child: Text(
                      'Login',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/