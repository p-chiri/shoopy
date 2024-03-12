import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentit/bindings/general_bindings.dart';
import 'package:rentit/pages/home_page.dart';
import 'package:rentit/pages/onboarding.dart';
import 'package:rentit/values/app_colors.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';
import 'models/user_details.dart';
import 'values/app_theme.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'values/app_constants.dart';
import 'values/app_routes.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding : widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Initialize GetX and register UserDetails
  Get.put<UserDetails>(UserDetails());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ).then(
        (_) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login and Register UI',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      //initialRoute: AppRoutes.OnboardingScreen,
      home:  Scaffold(backgroundColor: AppColors.primaryColor,body: const Center(child: CircularProgressIndicator(color: Colors.white),),),
      navigatorKey: AppConstants.navigationKey,
      routes: {
        AppRoutes.loginScreen: (context) => const LoginPage(),
        AppRoutes.registerScreen: (context) => const RegisterPage(),
        AppRoutes.homeScreen: (context) => const HomePage(),
        AppRoutes.OnboardingScreen: (context) => const OnBoardingScreen(),
        //AppRoutes.loanonboardScreen: (context) => const LoanOnboard(),
        //AppRoutes.loanDetailOneScreen: (context) => const LoanScreenOne(),
      },
    );
  }
}