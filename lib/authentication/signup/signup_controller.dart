import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rentit/data/repositories/authentication/authentication_repository.dart';
import 'package:rentit/data/repositories/user/user_repository.dart';
import 'package:rentit/helpers.dart';
import 'package:rentit/models/user_model.dart';
import 'package:rentit/pages/verify_email.dart';

import '../../utils/full_screen_loader.dart';
import '../network_manager.dart';

class SignupController extends GetxController{
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  void signup() async {
    try {
      // Start loading
      openProcessingDialog(Get.overlayContext!);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        closeProcessingDialog(Get.overlayContext!);
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        closeProcessingDialog(Get.overlayContext!);
        return;
      }
      if(!privacyPolicy.value){
        Helpers.warningSnackBar(title: "Privacy Policy",message: "You Must accept the privacy policy to continue");
      }

      final userCredential =  await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
      final newUser = User(
          email: email.text.trim(),
          lastName: lastName.text.trim(),
          firstName: firstName.text.trim(),
          username: username.text.trim(),
          password: password.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          ProfilePicture: '',
          id: userCredential.user!.uid);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      Helpers.successSnackBar(title: 'Congratulations', message: 'Your Account was Successfully Created! Verify Email to continue');

      Get.to(() => VerifyEmailScreen(email: email.text.trim(),));
    }

    catch(e){
      closeProcessingDialog(Get.overlayContext!);
      Helpers.errorSnackBar(title: "Oh! Snap", message: e.toString());
    }
  }
}