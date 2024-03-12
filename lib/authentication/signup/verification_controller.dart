import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/screens/success_screen.dart';

import '../../data/repositories/authentication/authentication_repository.dart';

class VerificationController extends GetxController {
  static VerificationController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForRedirect();
    checkEmailVerificationStatus();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Helpers.successSnackBar(
          title: "Sent Successfully", message: "Verify Email sent To continue");
    } catch (e) {
      Helpers.errorSnackBar(title: "Oh! Snap", message: e.toString());
    }
  }

  setTimerForRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() =>
            SuccessScreen(onPressed: () =>
                AuthenticationRepository.instance.screenRedirect(),

            ));
      }
    });
  }

  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() =>
          SuccessScreen(onPressed: () =>
              AuthenticationRepository.instance.screenRedirect()));
    }
  }
}