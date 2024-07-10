import 'package:flutter/material.dart';


class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String donationItem = 'Clothes';
  int quantity = 1;
  String purpose = '';
  String comments = '';
  bool subscribe = false;
  bool anonymous = false;
  bool _isSubmitted = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process donation (you can implement saving or sending data here)

      // Clear form fields
      setState(() {
        _isSubmitted = true;
        fullName = '';
        email = '';
        phoneNumber = '';
        address = '';
        donationItem = 'Clothes';
        quantity = 1;
        purpose = '';
        comments = '';
        subscribe = false;
        anonymous = false;
      });

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thank you! Your donation details have been saved. We will contact you soon.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Donation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
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
              SizedBox(height: 16),
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
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                initialValue: phoneNumber,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  phoneNumber = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                initialValue: address,
                onChanged: (value) {
                  address = value;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Donation Item'),
                value: donationItem,
                items: ['Clothes', 'Blankets', 'Books', 'Other']
                    .map((item) => DropdownMenuItem(
                  child: Text(item),
                  value: item,
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    donationItem = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Quantity'),
                initialValue: quantity.toString(),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1;
                },
                validator: (value) {
                  if (value!.isEmpty || int.tryParse(value!) == null || int.tryParse(value)! <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Purpose (optional)'),
                initialValue: purpose,
                onChanged: (value) {
                  purpose = value;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Comments (optional)'),
                initialValue: comments,
                onChanged: (value) {
                  comments = value;
                },
              ),
              SizedBox(height: 16),
              CheckboxListTile(
                title: Text('Donate anonymously'),
                value: anonymous,
                onChanged: (value) {
                  setState(() {
                    anonymous = value!;
                  });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _isSubmitted ? null : _submitForm,
                child: Text('Donate'),
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
