import 'package:flutter/material.dart';
import 'package:pro3/src/screens/login.dart';
import 'package:pro3/src/screens/otp.dart';

class emailotp extends StatelessWidget {
  const emailotp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return login();
            }));
          },
        ),
      ),
      body: SingleChildScrollView(
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
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text("Forget Password", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text("Please enter your E-Mail", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: TextFormField(

                decoration: InputDecoration(

                  hintText: "Email Adress",
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),

                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return otp();
                  }));
                },
                child: Text('Next'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
