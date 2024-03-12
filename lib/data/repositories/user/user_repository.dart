import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(User user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseException catch(e){
      throw e.message.toString();
    }catch (e){
      throw "An Error Occured while registering.....";
    }
  }
}