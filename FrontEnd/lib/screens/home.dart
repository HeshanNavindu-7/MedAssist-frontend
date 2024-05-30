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

  @override
  void initState() {
    super.initState();
    _fetchDetails();
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Hello, ${userName ?? 'Guest'}',
                        style: const TextStyle(fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Notifications()),
                          );
                        },
                        child: const Image(
                          image: AssetImage('assets/notification.png'),
                          height: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 189, 189, 189)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 25,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search doctor, drugs, articles...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavigationIcon(
                    'assets/market.jpg',
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
            ),
            const Positioned(
              top: 230,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage('assets/Learn_more.png'),
                height: 200,
              ),
            ),
            Positioned(
              top: 420,
              left: 30,
              right: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Top Doctors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorRecommendation()),
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
            Positioned(
              top: 480,
              left: 25,
              right: 25,
              child: _buildDoctorCard(context),
            ),
            Positioned(
              top: 728,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationIcon(
      String imagePath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image(
            image: AssetImage(imagePath),
            height: 100,
            width: 50,
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context) {
    return Container(
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
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
    );
  }
}
