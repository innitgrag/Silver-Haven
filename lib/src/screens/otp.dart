import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pro3/src/controller/otp_controller.dart';
import 'package:pro3/src/screens/dashboard.dart';
import 'package:pro3/src/screens/login.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OTPController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40.0,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Image.asset(
                  "images/logo2black.png",
                  width: 300,
                  height: 300,
                ),
                width:300,
                height: 300,
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Text('Please Enter the OTP', style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
              ),
              OtpTextField(
            numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (otp){
              OTPController.instance.verifyOTP(otp);
                },
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.fromLTRB(0, 20, 60, 0),
                child: ElevatedButton(
                  onPressed: (){
                    if (OTPController.instance.isVerified.value) {
                      Get.offAll(() => const dashboard());
                    } else {
                      Get.snackbar('Error', 'OTP verification failed');
                    }
                  },
                  child: Text('Next'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
