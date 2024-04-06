import 'package:flutter/material.dart';
import 'home_page.dart';
import 'booking_history_page.dart';
import 'account_page.dart';

class TrendingPage extends StatelessWidget {
  final Map<String, Map<String, dynamic>> cityDetails = {
    'mumbai': {
      'photo': 'assets/mumbai.png',
    },
    'delhi': {
      'photo': 'assets/delhi.png',
    },
    'agra': {
      'photo': 'assets/agra.png',
    },
    'andaman_and_nicobar': {
      'photo': 'assets/andaman_and_nicobar.png',
    },
    'anrunachal_pradesh': {
      'photo': 'assets/anrunachal_pradesh.png',
    },
    'goa': {
      'photo': 'assets/goa.png',
    },
    'jaipur': {
      'photo': 'assets/jaipur.png',
    },
    'kerala': {
      'photo': 'assets/kerala.png',
    },
    'lakshadweep': {
      'photo': 'assets/lakshadweep.png',
    },
    'varanasi': {
      'photo': 'assets/varanasi.png',
    },
    'udaipur': {
      'photo': 'assets/udaipur.png',
    },
    'ladakh': {
      'photo': 'assets/ladakh.png',
    },
    'munsiyari': {
      'photo': 'assets/munsiyari.png',
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        children: [
          Center(
            child: Text(
              'Trending',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          buildBannerButton(context, 'assets/banner1.png', 'kerala'),
          SizedBox(height: 16),
          buildBannerButton(context, 'assets/banner2.png', 'goa'),
          SizedBox(height: 16),
          buildBannerButton(context, 'assets/banner3.png', 'ladakh'),
          SizedBox(height: 16),
          buildBannerButton(context, 'assets/banner4.png', 'udaipur'),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  Widget buildBannerButton(BuildContext context, String imagePath,
      [String? cityName]) {
    return GestureDetector(
      onTap: () {
        if (cityName != null) {
          _handleBannerPressed(context, cityName);
        } else {}
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(imagePath),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
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
                  color: Colors.white,
                  onPressed: () {},
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
                  color: Colors.grey,
                  onPressed: () {
                    _handleNavigation(context, AccountPage());
                  },
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

  void _handleBannerPressed(BuildContext context, String cityName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CityDetailsPage(
          photo: cityDetails[cityName]!['photo'],
        ),
      ),
    );
  }
}
