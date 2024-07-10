import 'package:flutter/material.dart';
import 'package:pro3/src/after_signup/hyderabad/ashram_hyd/laxmi.dart';
import 'package:pro3/src/after_signup/hyderabad/ashram_hyd/saibaba.dart';
import 'package:pro3/src/after_signup/hyderabad/ashram_hyd/sunshine.dart';

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
        onPressed: (){
              Navigator.pop(context);
        },
        ),

        title: Container(
          child: Text('Hyderabad', ),
          margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
        ),

      ),
      body: Container(
        child: ListView(
          itemExtent: 120.0,
          children: [
            Container(
              child: Center(
                  child: Text('OLD AGE HOMES', style: TextStyle(fontWeight: FontWeight.w500,fontSize: 40),)
              ),
              margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
            ),
            ListTile(
              leading: Image.asset("images/logo.jpg"),
              title: Text('Lakshmi Old Age Home',style: TextStyle(fontSize: 20),),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return laxmi();
                }));
              },
            ),
            ListTile(
              leading: Image.asset("images/logo.jpg"),
              title: Text('Saibaba Old Age Home',style: TextStyle(fontSize: 20),),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return saibaba();
                }));
              },
            ),
            ListTile(
              leading: Image.asset("images/logo.jpg"),
              title: Text('Sunshine Old Age Home',style: TextStyle(fontSize: 20),),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return sunshine();
                }));
              },
            ),


          ],
        ),
      ),
    );
  }
}