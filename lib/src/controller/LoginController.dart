import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro3/src/after_signup/message.dart';
import 'package:pro3/src/repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  RxString email = ''.obs; // Use RxString for reactive email
  RxString password = ''.obs; // Use RxString for reactive password
final isGoogleLoading =false.obs;


  Future<void> login() async {
    String? error = await RegisterRepository.instance.loginWithEmailAndPassword(
      email.value.trim(), // Access value from RxString with .value
      password.value.trim(), // Access value from RxString with .value
    );
    if (error != null) {
      Get.snackbar(
        "Login Failed",
        error,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 5),
        animationDuration: Duration(milliseconds: 800),
        borderRadius: 10,
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

}
