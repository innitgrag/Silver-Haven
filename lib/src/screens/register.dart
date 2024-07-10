import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro3/src/auth_service/auth_service.dart';
import 'package:pro3/src/controller/register_controller.dart';
import 'package:pro3/src/screens/dashboard.dart';
import 'package:pro3/src/screens/login.dart';
import 'package:pro3/src/screens/otp.dart';
import 'package:pro3/src/screens/verifyotp.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Image.asset(
                  "images/logo2black.png",
                  width: 150,
                  height: 150,
                ),
                width: 130,
                height: 130,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Get On Board!',
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 50),
                    ),
                    alignment: Alignment.center,
                  ),
                  Text(
                    'Connecting Hearts, Enriching Golden Years',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.fullName,
                        decoration: InputDecoration(
                          hintText: "Full name",
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your full name';
                        //   }
                        //   return null;
                        // },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: controller.phoneNo,
                        decoration: InputDecoration(
                          hintText: "Phone Number (e.g. +1234567890)",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\+[1-9]\d{1,14}$').hasMatch(value)) {
                            return 'Please enter a valid phone number (e.g. +1234567890)';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: controller.password,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      RegisterController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                      Get.to(() => const otp());
                    }
                  },
                  child: Text('SIGNUP'),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(370, 30),
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 18)),
                ),
              ),
              const Text(
                'or',
                style: TextStyle(fontSize: 15),
              ),
              Container(
                child: OutlinedButton.icon(
                  onPressed: () async {
                    UserCredential? userCredential = await AuthService().signInWithGoogle();
                    if (userCredential != null) {
                      Get.to(() => dashboard()); // Redirect to Dashboard on successful sign-in
                    } else {
                      Get.snackbar('Error', 'Google Sign-In failed');
                    }
                  },
                  icon: Image(
                    image: AssetImage("images/google.png"),
                    width: 50,
                    height: 50,
                  ),
                  label: Text('Sign in with Google'),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(370, 30),
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 15)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an Account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => login());
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
