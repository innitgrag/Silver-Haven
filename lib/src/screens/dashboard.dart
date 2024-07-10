
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pro3/src/after_signup/Delhi/mainscreentwo.dart';
import 'package:pro3/src/after_signup/message.dart';
import 'package:pro3/src/repository/authentication_repository.dart';
import 'package:pro3/src/after_signup/hyderabad/mainscreen.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          child: CircleAvatar(
            child: Image.asset("images/logo2white.png",
            ),
            backgroundColor: Colors.black,
          ),
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        ),

        title: Container(
            child: Text('Dashboard', ),
        margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
        ),

        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return message();
                }));
              },
              icon: Icon(Icons.message_outlined)

          ),
          IconButton(
           icon:  Icon(Icons.logout),
            onPressed: (){
              RegisterRepository.instance.logout();
              Get.offAllNamed('/login');
            },



          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Text('Major Popular cities',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
              ),
            ),
            Container(
              child: Center(
                child: Image.asset("images/banner.png")
              ),
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return mainscreen();
                  }));
                },
                child: Text('HYDEREBAD'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 22),
                  fixedSize: Size(280, 70),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
        
              ),
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return mainscreentwo();
                  }));
                },
                child: Text('DELHI'),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(fontSize: 22),
                  fixedSize: Size(280, 70),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
        
              ),
              margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
            ),

          ],
        ),
      ),
    );
  }
}
