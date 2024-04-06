import 'package:flutter/material.dart';
import 'booking_history_page.dart';
import 'trending_page.dart';
import 'account_page.dart';

class HomePage extends StatelessWidget {
  final Map<String, Map<String, dynamic>> cityDetails = {
    'mumbai': {'photo': 'assets/mumbai.png'},
    'delhi': {'photo': 'assets/delhi.png'},
    'agra': {'photo': 'assets/agra.png'},
    'andaman_and_nicobar': {'photo': 'assets/andaman_and_nicobar.png'},
    'arunachal_pradesh': {'photo': 'assets/arunachal_pradesh.png'},
    'goa': {'photo': 'assets/goa.png'},
    'jaipur': {'photo': 'assets/jaipur.png'},
    'kerala': {'photo': 'assets/kerala.png'},
    'lakshadweep': {'photo': 'assets/lakshadweep.png'},
    'varanasi': {'photo': 'assets/varanasi.png'},
    'udaipur': {'photo': 'assets/udaipur.png'},
    'ladakh': {'photo': 'assets/ladakh.png'},
    'munsiyari': {'photo': 'assets/munsiyari.png'},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          title: Text('Home'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for like delhi,mumbai...',
                      ),
                      onSubmitted: (value) {
                        _handleSearch(context, value.toLowerCase());
                      },
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 40,
                      maxWidth: 40,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.notifications),
                      color: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No notifications'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Top destinations for your next holiday',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildBannerButton(context, 'assets/banner1.png', 'kerala'),
                  SizedBox(width: 10),
                  buildBannerButton(context, 'assets/banner2.png', 'goa'),
                  SizedBox(width: 10),
                  buildBannerButton(context, 'assets/banner3.png', 'ladakh'),
                  SizedBox(width: 10),
                  buildBannerButton(context, 'assets/banner4.png', 'udaipur'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Top experiences',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      buildTopExpRow(context, 'assets/top_exp1.png', 1),
                      SizedBox(height: 10),
                      buildTopExpRow(context, 'assets/top_exp2.png', 2),
                    ],
                  ),
                  Column(
                    children: [
                      buildTopExpRow(context, 'assets/top_exp3.png', 3),
                      SizedBox(height: 10),
                      buildTopExpRow(context, 'assets/top_exp4.png', 4),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: Positioned(
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
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.local_fire_department),
                    color: Colors.grey,
                    onPressed: () {
                      _handleTrending(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.confirmation_number),
                    color: Colors.grey,
                    onPressed: () {
                      _handleBookingHistory(context);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.grey,
                    onPressed: () {
                      _handleAccount(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBannerButton(
      BuildContext context, String imagePath, String cityName) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: 250,
      child: GestureDetector(
        onTap: () {
          _handleBannerPressed(context, cityName);
        },
        child: Image.asset(imagePath),
      ),
    );
  }

  Widget buildTopExpRow(BuildContext context, String imagePath, int index) {
    return GestureDetector(
      onTap: () {
        _handleTopExpPressed(context, index);
      },
      child: Container(
        width: 165,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(5),
      ),
    );
  }

  void _handleSearch(BuildContext context, String query) {
    if (cityDetails.containsKey(query)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityDetailsPage(
            photo: cityDetails[query]!['photo'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No details found for "$query"'),
      ));
    }
  }

  void _handleBannerPressed(BuildContext context, String cityName) {
    if (cityDetails.containsKey(cityName)) {
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

  void _handleTopExpPressed(BuildContext context, int index) {
    String cityName;
    switch (index) {
      case 1:
        cityName = 'goa';
        break;
      case 2:
        cityName = 'udaipur';
        break;
      case 3:
        cityName = 'ladakh';
        break;
      case 4:
        cityName = 'munsiyari';
        break;
      default:
        return;
    }

    if (cityDetails.containsKey(cityName)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityDetailsPage(
            photo: cityDetails[cityName]!['photo'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No details found for "$cityName"'),
      ));
    }
  }

  void _handleTrending(BuildContext context) {
    // Navigate to the TrendingPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrendingPage()),
    );
  }

  void _handleBookingHistory(BuildContext context) {
    // Navigate to the BookingHistoryPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BookingHistoryPage()),
    );
  }

  void _handleAccount(BuildContext context) {
    // Navigate to the AccountPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountPage()),
    );
  }
}

class CityDetailsPage extends StatelessWidget {
  final String photo;

  const CityDetailsPage({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            photo,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: -5,
            left: 35,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingHistoryPage()),
                );
              },
              child: Image.asset(
                'assets/book_now_button.png',
                width: 300,
                height: 125,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
