import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _agreeToTerms = false;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/login_background.png',
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
                SizedBox(height: 275),
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
                SizedBox(height: 0),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Implement Forgot Password functionality
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 0),
                CheckboxListTile(
                  title: Text(
                    'I agree with the terms and conditions by creating an account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: (_email.isNotEmpty &&
                          _password.isNotEmpty &&
                          _agreeToTerms)
                      ? () {
                          // Add login functionality here
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      : null,
                  child: Image.asset(
                    'assets/login_button.png',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'or login using',
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to home page when Google logo is pressed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Image.asset(
                          'assets/google_logo.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to home page when Facebook logo is pressed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Image.asset(
                          'assets/facebook_logo.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to home page when Twitter logo is pressed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Image.asset(
                          'assets/twitter_logo.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    // Navigate to Create Account page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateAccountPage()),
                    );
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold, // Make text bold
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
