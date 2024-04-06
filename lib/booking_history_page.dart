import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'home_page.dart';
import 'trending_page.dart';
import 'account_page.dart';

class BookingHistoryPage extends StatefulWidget {
  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;
  TextEditingController _sourceController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  String _price = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Booking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Source',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _sourceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Enter source',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Destination',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: 'Enter destination',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'From',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            _selectDate(context, true);
                          },
                          child: Text(_selectedFromDate == null
                              ? 'Select Date'
                              : DateFormat('dd/MM/yyyy')
                                  .format(_selectedFromDate!)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'To',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            _selectDate(context, false);
                          },
                          child: Text(_selectedToDate == null
                              ? 'Select Date'
                              : DateFormat('dd/MM/yyyy')
                                  .format(_selectedToDate!)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Price: $_price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  _handleBooking(context);
                },
                child: Text('Book Now'),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: Material(
          elevation: 10,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                  color: Colors.white,
                  onPressed: () {},
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

  void _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _selectedFromDate = picked;
        } else {
          _selectedToDate = picked;
        }
        _price = calculatePrice();
      });
    }
  }

  String calculatePrice() {
    if (_sourceController.text.isNotEmpty &&
        _destinationController.text.isNotEmpty &&
        _selectedFromDate != null &&
        _selectedToDate != null) {
      Random random = Random();
      int minPrice = 10000;
      int maxPrice = 25000;
      int randomPrice = minPrice + random.nextInt(maxPrice - minPrice + 1);

      return '₹$randomPrice';
    } else {
      return '';
    }
  }

  void _handleBooking(BuildContext context) {
    if (_sourceController.text.isNotEmpty &&
        _destinationController.text.isNotEmpty &&
        _selectedFromDate != null &&
        _selectedToDate != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking confirmed!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and select dates.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
