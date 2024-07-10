import 'package:get/get.dart';
import 'package:pro3/src/repository/authentication_repository.dart';
import 'package:pro3/src/screens/dashboard.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  var isVerified = false.obs;

  void verifyOTP(String otp) async {
    var verified = await RegisterRepository.instance.verifyOTP(otp);
    isVerified.value = verified;
    if (verified) {
      Get.offAll(const dashboard());
    } else {
      Get.back();
    }
  }
}
