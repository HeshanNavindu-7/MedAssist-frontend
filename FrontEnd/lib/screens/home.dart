import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:midassist/screens/aboutdoctor.dart';
import 'package:midassist/screens/ambulance.dart';
import 'package:midassist/screens/hospitals.dart';
import 'package:midassist/screens/market.dart';
import 'package:midassist/screens/notifications.dart';
import 'package:midassist/screens/cart.dart';
import 'package:midassist/APIs/doctorDetails.dart';
import 'package:midassist/APIs/userDetails.dart';
import 'custom_bottom_navigation_bar.dart';
import 'doctorRecommendation.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  String? doctorName;

  final ImageFilePicker imageFilePicker = ImageFilePicker();
  final http.Client client = http.Client();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _fetchDetails();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  Future<void> _fetchDetails() async {
    try {
      final results = await Future.wait([
        UserDataManager.fetchUserDetails(),
        DoctorDataManager.fetchDoctorDetails(),
      ]);

      final userDetails = results[0] as Map<String, dynamic>;
      final doctorDetails = results[1] as List<dynamic>;

      setState(() {
        userName = userDetails['name'];
        if (doctorDetails.isNotEmpty) {
          doctorName = doctorDetails[0]['name'];
        }
      });
    } catch (e) {
      print('Error: $e');
      // Consider showing an error message to the user
    }
  }

  Widget _buildGreenBox() {
    return Container(
      width: 300, // Adjust the width as needed
      height: 50, // Adjust the height as needed
      color: Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove the back button
          title: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Hello, ${userName ?? 'Guest'}',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()),
                  );
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    focusNode: _focusNode,
                    decoration: InputDecoration(
                      hintText:
                          _isFocused ? '' : 'Search doctor, drugs, articles...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavigationIcon(
                      'assets/shop.png',
                      'Market',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Market()),
                      ),
                    ),
                    _buildNavigationIcon(
                      'assets/cart.jpg',
                      'Cart',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Cart()),
                      ),
                    ),
                    _buildNavigationIcon(
                      'assets/hospital.jpg',
                      'Hospital',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Hospitals()),
                      ),
                    ),
                    _buildNavigationIcon(
                      'assets/ambulance.jpg',
                      'Ambulance',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ambulance()),
                      ),
                    ),
                  ],
                ),
                _buildGreenBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Top Doctors',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const DoctorRecommendation()),
                          );
                        },
                        child: const Text(
                          'See all',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromARGB(255, 24, 184, 149),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: _buildDoctorCard(context),
                ),
                SizedBox(
                  height: 50, // Adding extra space at the bottom
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }

  Widget _buildNavigationIcon(
      String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 80, // Adjust the width as needed
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 50, // Adjust the height as needed
                width: 50, // Adjust the width as needed
              ),
              const SizedBox(height: 8.0), // Space between image and text
              Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context) {
    return SizedBox(
      width: 150, // Set the desired width
      height: 250, // Set the desired height
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutDoctor()),
                );
              },
              child: const Image(
                image: AssetImage('assets/Doctor1.png'),
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$doctorName',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Cardiologist',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage('assets/Rating.png')),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage('assets/Location.png')),
                ),
                Text(
                  '800m away',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
