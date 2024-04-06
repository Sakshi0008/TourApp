import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _agreeToTerms = false;
  String _name = '';
  String _email = '';
  String _phoneNumber = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/create_account_background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _name = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _email = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your email address',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value.trim();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter your phone number',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _password = value.trim();
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                  title: Text(
                    'I agree with the terms and conditions by creating an account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.black,
                ),
                SizedBox(height: 0),
                InkWell(
                  onTap: (_name.isNotEmpty &&
                          _email.isNotEmpty &&
                          _phoneNumber.isNotEmpty &&
                          _password.isNotEmpty &&
                          _agreeToTerms)
                      ? () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      : null,
                  child: Image.asset(
                    'assets/create_account_button.png',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
