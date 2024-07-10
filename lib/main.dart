import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro3/firebase_options.dart';
import 'package:pro3/src/repository/authentication_repository.dart';
import 'package:pro3/src/screens/register.dart';
import 'package:get/get.dart';
import 'package:pro3/src/controller/otp_controller.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value)=> Get.put(RegisterRepository()));
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Silver Haven',
      themeMode: ThemeMode.system,
      home: Register(),
    );
  }
}


