import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rentit/navigation_menu.dart';
import 'package:rentit/pages/login_page.dart';
import 'package:rentit/pages/onboarding.dart';
import 'package:rentit/pages/verify_email.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
   if(user != null){
     if(user.emailVerified){
       Get.offAll(() => const NavigationMenu());
     }else{
       Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
     }
   }else{
     deviceStorage.writeIfNull('isFirstTime', true);
     deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginPage()) : Get.offAll(const OnBoardingScreen());
   }
    //local storage

  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    }on FirebaseException catch(e){
      throw e.message.toString();
    }catch (e){
      throw  "Login was not successfull ";
    }
  }
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase Authentication exceptions
      String errorMessage = "An error occurred while registering. Please try again.";

      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
      // Add more cases as needed based on your requirements
        default:
          errorMessage = "An error occurred while registering. Please try again.";
      }

      throw errorMessage;
    } catch (e) {
      // Handle other exceptions (not FirebaseAuthException)
      throw "An unexpected error occurred. Please try again later.";
    }
  }

  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseException catch(e){
      throw e.message.toString();
    }catch (e){
      throw "something prevented the sending of the email";
    }
  }

  Future<void> logout() async{
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginPage());
    }on FirebaseException catch(e){
      throw e.message.toString();
    }catch(e){
      throw "could not log you out.....";
    }
  }
}