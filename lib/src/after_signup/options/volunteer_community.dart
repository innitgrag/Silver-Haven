import 'package:flutter/material.dart';

class CommunityVolunteerForm extends StatefulWidget {
  @override
  _CommunityVolunteerFormState createState() => _CommunityVolunteerFormState();
}

class _CommunityVolunteerFormState extends State<CommunityVolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  String organizationName = '';
  String contactPerson = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String mission = '';
  String activities = '';
  bool _isSubmitted = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process volunteer information (save or send data)

      // Clear form fields
      setState(() {
        _isSubmitted = true;
        organizationName = '';
        contactPerson = '';
        email = '';
        phoneNumber = '';
        address = '';
        mission = '';
        activities = '';
      });

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you! Your community volunteer details have been saved. We will contact you soon.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Volunteer Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Organization Name'),
                initialValue: organizationName,
                onChanged: (value) {
                  organizationName = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter organization name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Person'),
                initialValue: contactPerson,
                onChanged: (value) {
                  contactPerson = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter contact person';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email Address'),
                initialValue: email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                validator: (value) {
                  if (value!.isEmpty || !value!.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                initialValue: phoneNumber,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                initialValue: address,
                onChanged: (value) {
                  address = value;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mission'),
                initialValue: mission,
                onChanged: (value) {
                  mission = value;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Activities'),
                initialValue: activities,
                onChanged: (value) {
                  activities = value;
                },
              ),
              SizedBox(height: 16,),
              ElevatedButton(
                onPressed: _isSubmitted ? null : _submitForm,
                child: Text('Volunteer',style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
