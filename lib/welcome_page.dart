import 'package:flutter/material.dart';
import "login_page.dart";

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/1.Wel_1.png',
    'assets/2.Wel_2.png',
    'assets/3.Wel_3.png',
    'assets/4.Wel_4.png',
  ];

  void _nextImage() {
    if (_currentIndex < _imagePaths.length - 1) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _continuePressed() {
    // Navigate to the LoginPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(_imagePaths[_currentIndex]),
                  Positioned(
                    bottom: 20,
                    left: 40,
                    child: _currentIndex < _imagePaths.length - 1
                        ? SizedBox(
                            width: 300,
                            height: 125,
                            child: IconButton(
                              icon: Image.asset('assets/next_button.png'),
                              onPressed: _nextImage,
                            ),
                          )
                        : SizedBox(
                            width: 300,
                            height: 125,
                            child: IconButton(
                              icon: Image.asset('assets/continue_button.png'),
                              onPressed:
                                  _continuePressed, // Navigate to LoginPage
                            ),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
