import 'package:flutter/material.dart';
import 'package:midassist/screens/aboutdoctor.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/doctorRecommendation.dart';

class Market extends StatelessWidget {
  const Market({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 10, // Adjusted padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                const Text(
                  'Market',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
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
                  hintText: 'Search for items...',
                  prefixIcon: const Icon(Icons.search), // Removed 'const'
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 25,
            right: 150,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutDoctor(),
                            ),
                          );
                        },
                        child: const Image(
                          image: AssetImage('assets/beauty.png'),
                          height: 120,
                          width: 130,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Boston Round Pack',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 5),
                        child: Text(
                          'Cream and Body Lotion',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/Rating.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rs. 5625/=',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: Image(
              image: AssetImage('assets/Bottom_rectangle.png'),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 715, left: 20), // Adjusted padding
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: const Image(image: AssetImage('assets/Home.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 715, left: 40),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Market()), // Corrected class name
                      );
                    },
                    child: const Image(image: AssetImage('assets/Market.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 715, left: 30), // Adjusted padding
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DoctorRecommendation()),
                      );
                    },
                    child: const Image(image: AssetImage('assets/Camera.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 715, left: 15), // Adjusted padding
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MedAssistAi()),
                      );
                    },
                    child: const Image(image: AssetImage('assets/Ai.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 715, left: 30), // Adjusted padding
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfilePage()),
                      );
                    },
                    child: const Image(image: AssetImage('assets/Profile.png')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
