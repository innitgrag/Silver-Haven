import 'package:flutter/material.dart';
import 'package:pro3/src/after_signup/options/donatedir/add.dart';

class donate extends StatelessWidget {
  const donate({super.key});

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
          child: Text('Donate', ),
        ),

      ),

      body: Container(
        child: ListView(
          itemExtent: 80.0,
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Center(child: Text("Previously donated items: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),))),
            ListTile(
                  leading: Image.asset('images/clothes.jpg'),
              title: Text('Clothes', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),

            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: ListTile(
                leading: Image.asset('images/umbrella.jpeg'),
                title: Text('Umbrella', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
              ),
            ),
            ListTile(
              leading: Image.asset('images/firstAid.avif'),
              title: Text('First Aid Kit', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
            ),
            ListTile(
              leading: Image.asset('images/blanket.png'),
              title: Text('Blanket', style: TextStyle(fontWeight: FontWeight.w300,fontSize: 30),),
            ),

            Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Center(child: Text("Add your items here: ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),))),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 0, 20),
              child: ElevatedButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DonationForm();
                }));
              },
              
                  icon: Icon(Icons.add_circle_outline),
                  label: Text('Add', style: TextStyle(fontSize: 40),),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(100, 50),
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
