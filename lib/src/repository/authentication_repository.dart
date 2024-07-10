import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro3/src/exceptions/signup_failure.dart';
import 'package:pro3/src/screens/dashboard.dart';
import 'package:get/get.dart';
import 'package:pro3/src/screens/otp.dart';
import 'package:pro3/src/screens/register.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterRepository extends GetxController {
  static RegisterRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const Register()) : Get.offAll(() => const dashboard());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
          Get.offAll(()=> const dashboard());
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          Get.to(() => const otp());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          } else {
            Get.snackbar('Error', 'Something went wrong. Try again.');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'An error occurred during phone authentication. Please try again.');
    }
  }

  Future<bool> verifyOTP(String otp) async {
    try {
      var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value,
        smsCode: otp,
      ));
      return credentials.user != null? true: false;
    } catch (e) {
      Get.snackbar('Error', 'Invalid OTP. Please try again.');
      return false;
    }
  }

  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const dashboard()) : Get.to(() => const Register());
    } on FirebaseAuthException catch (e) {
      final ex = SignupFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignupFailure();
      return ex.message;
    }
    return null;
  }

  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const dashboard()) : Get.to(() => const Register());
    } on FirebaseAuthException catch (e) {
      final ex = SignupFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignupFailure();
      return ex.message;
    }
    return null;
  }




  Future<void> logout() async => await _auth.signOut();
}
