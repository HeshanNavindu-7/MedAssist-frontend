import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:midassist/screens/aboutdoctor.dart';
import 'package:midassist/screens/ambulance.dart';
import 'package:midassist/screens/cart.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';
import 'package:midassist/screens/doctorRecommendation.dart';
import 'package:midassist/screens/hospitals.dart';
import 'package:midassist/screens/market.dart';
import 'package:midassist/screens/notifications.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userName;
  List<Map<String, dynamic>> topDoctors = [];

  @override
  void initState() {
    super.initState();
    _fetchDetails(); // Fetch details when the page initializes
  }

  Future<void> _fetchDetails() async {
    // Your existing code for fetching user and doctor details
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 173, 216, 230),
          automaticallyImplyLeading: false,
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
                    decoration: InputDecoration(
                      hintText: 'Search doctor, drugs, articles...',
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
                      'assets/carts.png',
                      'Cart',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Cart()),
                      ),
                    ),
                    _buildNavigationIcon(
                      'assets/hospitals.png',
                      'Hospital',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Hospitals()),
                      ),
                    ),
                    _buildNavigationIcon(
                      'assets/ambulances.png',
                      'Ambulance',
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ambulance()),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: _buildImageCarousel(),
                ),
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
                  child: _buildDoctorCarousel(),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }

  Widget _buildImageCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 110,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        viewportFraction: 1,
      ),
      items: [
        'assets/CarosalCard/img1.png',
        'assets/CarosalCard/img2.png',
        'assets/CarosalCard/img3.png'
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
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
          width: 80,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(imagePath),
                height: 50,
                width: 50,
              ),
              const SizedBox(height: 8.0),
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

  Widget _buildDoctorCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: topDoctors.map((doctor) {
        return Builder(
          builder: (BuildContext context) {
            return _buildDoctorCard(context, doctor);
          },
        );
      }).toList(),
    );
  }

  Widget _buildDoctorCard(
      BuildContext context, Map<String, dynamic> doctorData) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutDoctor()),
              );
            },
            child: const Image(
              image: AssetImage('assets/doc.png'),
              height: 120,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              doctorData['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              doctorData['specialization'],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
