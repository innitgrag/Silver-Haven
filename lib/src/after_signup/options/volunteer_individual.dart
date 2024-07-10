import 'package:flutter/material.dart';

class IndividualVolunteerForm extends StatefulWidget {
  @override
  _IndividualVolunteerFormState createState() => _IndividualVolunteerFormState();
}

class _IndividualVolunteerFormState extends State<IndividualVolunteerForm> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String availability = '';
  String interests = '';
  bool _isSubmitted = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process volunteer information (save or send data)

      // Clear form fields
      setState(() {
        _isSubmitted = true;
        fullName = '';
        email = '';
        phoneNumber = '';
        address = '';
        availability = '';
        interests = '';
      });

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you! Your volunteer details have been saved. We will contact you soon.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Individual Volunteer Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                initialValue: fullName,
                onChanged: (value) {
                  fullName = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
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
                decoration: InputDecoration(labelText: 'Availability'),
                initialValue: availability,
                onChanged: (value) {
                  availability = value;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                decoration: InputDecoration(labelText: 'Interests'),
                initialValue: interests,
                onChanged: (value) {
                  interests = value;
                },
              ),
              SizedBox(height: 25,),
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
