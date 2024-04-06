import 'package:flutter/material.dart';
import 'home_page.dart';
import 'trending_page.dart';
import 'booking_history_page.dart';
import 'login_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String username = 'User${DateTime.now().millisecondsSinceEpoch}';

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/profile_icon.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 10),
                Text(
                  username,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 0),
                Container(
                  width: 200,
                  height: 150,
                  child: IconButton(
                    icon: Image.asset('assets/logout.png'),
                    onPressed: () {
                      _handleLogout(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Material(
          elevation: 10,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.grey,
                  onPressed: () {
                    _handleNavigation(context, HomePage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.local_fire_department),
                  color: Colors.grey,
                  onPressed: () {
                    _handleNavigation(context, TrendingPage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.confirmation_number),
                  color: Colors.grey,
                  onPressed: () {
                    _handleNavigation(context, BookingHistoryPage());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _handleLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      (route) => false,
    );
  }
}
