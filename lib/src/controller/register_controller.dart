import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro3/src/repository/authentication_repository.dart';

class RegisterController extends GetxController{
  static RegisterController get instance => Get.find();


  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  void registerUser(String email, String password){
RegisterRepository.instance.createUserWithEmailAndPassword(email, password);
  }



void phoneAuthentication(String phoneNo){
RegisterRepository.instance.phoneAuthentication(phoneNo);
}

}