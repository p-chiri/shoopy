import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rentit/authentication/Login/Login_controller.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/pages/forgot_password.dart';
import 'package:rentit/pages/register_page.dart';
import 'package:rentit/values/app_colors.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                      height: 150,
                      image: AssetImage("assets/images/FINCORP-LOGO-Recovered.png")),
                  Text(
                    "Welcome Back",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: TSizes.sm,),
                  Text(
                    "Welcome to the World of Infinite Possiblities at the tap of a button",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: TSizes.lg,),
                  // ...

                  Form(
                    key: controller.loginFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.email,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.direct_right),
                              labelText: "Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!GetUtils.isEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
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
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                        () => Checkbox(
                                      value: controller.rememberMe.value,
                                      onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value
                                      ,
                                    ),
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                              TextButton(
                                onPressed: () => Get.to(const ForgotPasswordScreen()),
                                child: const Text("Forgot password"),
                              ),
                            ],
                          ),

                          const SizedBox(height: TSizes.spaceBtwItems,),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => controller.emailAndPasswordSignIn(),
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
                              child: const Text("Sign In", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          // ...
                          const SizedBox(height: TSizes.spaceBtwItems,),
                          SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(onPressed: ()=> Get.to(() => const RegisterPage()), child: Text("Create Account")
                              )
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems,),
                        ],
                      ),
                    ),
                  ),

// ...

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(child: Divider(color: AppColors.grey, thickness: 0.5, indent: 60, endIndent: 5,)),
                      Text("or sign in with"),
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
                          onPressed: (){}, icon: const Image(
                          width: 20,
                            height: 20,
                            image: AssetImage("assets/images/search.png")
                        ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      // Container(
                      //   decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(20)),
                      //   child: IconButton(
                      //     onPressed: (){}, icon: Image(
                      //       width: 20,
                      //       height: 20,
                      //       image: AssetImage("assets/images/facebook1.png")
                      //   ),
                      //   ),
                      // )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:flutter_svg/svg.dart';

//import '../components/app_text_form_field.dart';
//import '../resources/vectors.dart';
//import '../utils/extensions.dart';
//import '../values/app_colors.dart';
//import '../values/app_constants.dart';
//import '../values/app_routes.dart';
/*
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuerySize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: size.height * 0.24,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1E2E3D),
                      Color(0xff152534),
                      Color(0xff0C1C2E),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign in to your\nAccount',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Sign in to your Account',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextFormField(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
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
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        _formKey.currentState?.validate();
                      },
                      validator: (value) {
                        return value!.isEmpty
                            ? 'Please, Enter Password'
                            : AppConstants.passwordRegex.hasMatch(value)
                            ? null
                            : 'Invalid Password';
                      },
                      controller: passwordController,
                      obscureText: isObscure,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
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
                    TextButton(
                      onPressed: () {},
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () => AppRoutes.homeScreen.pushName(),
                      style: ElevatedButton.styleFrom(
                        primary: _formKey.currentState?.validate() ?? false
                            ? null
                            : Colors.grey.shade300,
                      ),
                      child: const SizedBox(
                        width: double.infinity, // Set the width to occupy the entire available space
                        child: Center(
                          child: Text('Login'),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            'Or login with',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: Theme.of(context).outlinedButtonTheme.style,
                            icon: SvgPicture.asset(
                              Vectors.googleIcon,
                              width: 14,
                            ),
                            label: const Text(
                              'Google',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            style: Theme.of(context).outlinedButtonTheme.style,
                            icon: SvgPicture.asset(
                              Vectors.facebookIcon,
                              width: 14,
                            ),
                            label: const Text(
                              'Facebook',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () => AppRoutes.registerScreen.pushName(),
                      style: Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'Register',
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
      ),
    );
  }
}*/
