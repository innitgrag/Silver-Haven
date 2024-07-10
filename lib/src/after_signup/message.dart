import 'package:flutter/material.dart';

class message extends StatelessWidget {
  const message({super.key});

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
          child: Text('Messages', ),
        ),

      ),

      body: Center(child: Text("No messages to show",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),)),
    );
  }
}
