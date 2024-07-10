import 'package:flutter/material.dart';
import 'package:pro3/src/after_signup/options/donatedir/add.dart';
import 'package:pro3/src/after_signup/options/donatedir/donate.dart';

import '../../options/volunteer_community.dart';
import '../../options/volunteer_individual.dart';

class sunshine extends StatelessWidget {
  const sunshine({super.key});

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
          child: Text('Sunshine Old Age Home', ),
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset("images/oldage.jpg",
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('About Us: ' , style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Nulla a enim ut massa vehicula dapibus. Duis sollicitudin, ligula et '
                  'fermentum cursus, felis neque bibendum diam, at vulputate mauris velit eget '
                  'erat. Nullam ultricies vulputate malesuada. Vestibulum quis posuere lorem, non placerat '
                  'urna. Cras egestas nisi at erat dignissim aliquet. Mauris velit neque, fringilla '
                  'eget aliquam in, vestibulum non nibh. Donec interdum iaculis ornare.' ,
                style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300),),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.fromLTRB(0, 0, 17, 0),
                    child: ElevatedButton.icon(
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
                                    'Select how you would like to volunteer',
                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                                  ),
                                ),
                                TextButton.icon(
                                  icon: Icon(Icons.person_outline, size: 50),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return IndividualVolunteerForm();
                                    }));
                                  },
                                  label: Text('As an Individual'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(370, 80),
                                    shape: RoundedRectangleBorder(),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextButton.icon(
                                  icon: Icon(Icons.group_outlined, size: 50),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return CommunityVolunteerForm();
                                    }));
                                  },
                                  label: Text('As a Community'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(370, 80),
                                    shape: RoundedRectangleBorder(),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                    textStyle: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.handshake_outlined),
                      label: Text(
                        'Volunteer',),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return donate();
                      }));
                    },
                    icon: Icon(Icons.monetization_on_outlined),
                    label: Text('Donate'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.call),
                    label: Text('Call Us'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
