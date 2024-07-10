import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pro3/src/auth_service/auth_service.dart';
import 'package:pro3/src/controller/LoginController.dart';
import 'package:pro3/src/screens/dashboard.dart';
import 'package:pro3/src/screens/emailotp.dart';
import 'package:pro3/src/screens/phoneotp.dart';
import 'package:pro3/src/screens/register.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
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
                      'Welcome Back!!',
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
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => controller.email.value = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email Address",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        onChanged: (value) => controller.password.value = value,
                        obscureText: true, // Hides the password input
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.fromLTRB(0, 0, 17, 0),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Make Selection',
                              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 35),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              child: Text(
                                'Select one of the options given below to reset your password',
                                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                              ),
                            ),
                            TextButton.icon(
                              icon: Icon(Icons.mail_outline, size: 50),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return emailotp();
                                }));
                              },
                              label: Text('E-Mail'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(370, 80),
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                textStyle: TextStyle(fontSize: 30),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextButton.icon(
                              icon: Icon(Icons.phone_iphone_outlined, size: 50),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return phoneotp();
                                }));
                              },
                              label: Text('Phone No'),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(370, 80),
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                textStyle: TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Text('LOGIN'),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(370, 30),
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 18),
                  ),
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
                    textStyle: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an Account?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => Register());
                      },
                      child: Text(
                        'Sign Up',
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
