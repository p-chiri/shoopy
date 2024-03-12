import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentit/data/repositories/authentication/authentication_repository.dart';

import '../../helpers.dart';
import '../../utils/full_screen_loader.dart';
import '../network_manager.dart';

class LoginController extends GetxController{

  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start loading
      openProcessingDialog(Get.overlayContext!);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        closeProcessingDialog(Get.overlayContext!);
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        closeProcessingDialog(Get.overlayContext!);
        return;
      }

      if(rememberMe.value){
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      closeProcessingDialog(Get.overlayContext!);

      AuthenticationRepository.instance.screenRedirect();


    }

    catch(e){
      closeProcessingDialog(Get.overlayContext!);
      Helpers.errorSnackBar(title: "Oh! Snap", message: e.toString());
    }
  }
}