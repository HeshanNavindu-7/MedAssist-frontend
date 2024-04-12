import 'package:flutter/material.dart';
import 'package:midassist/screens/secondPage.dart';

class DoctorRecommendation extends StatelessWidget {
  const DoctorRecommendation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 20, right: 180), // Added 'const'
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image(
                      image: AssetImage('assets/back.png'),
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Doctors',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
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
                  hintText: 'Search for doctors...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
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
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Doctor1.png'),
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Dr. Marcus Holmes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 5),
                        child: Text(
                          'Cardiologist',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
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
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/Location.png'),
                            ),
                          ),
                          Text(
                            '800m away',
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
          Positioned(
            top: 180,
            left: 205,
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
                  child: const Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Dr2.jpg'),
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Dr. Bellamy Robert',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: EdgeInsets.only(top: 0, bottom: 5),
                        child: Text(
                          'Viralogist',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/Dr2rate.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage('assets/Location.png'),
                            ),
                          ),
                          Text(
                            '500m away',
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
                  padding: const EdgeInsets.only(top: 715, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DoctorRecommendation()), // Corrected class name
                      );
                    },
                    child: const Image(image: AssetImage('assets/Home.png')),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 715, left: 40),
                  child: Image(image: AssetImage('assets/Market.png')),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 715, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const DoctorRecommendation()), // Corrected class name
                      );
                    },
                    child: const Image(image: AssetImage('assets/Camera.png')),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 715, left: 40),
                  child: Image(image: AssetImage('assets/GlovaAI.png')),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 715, left: 30),
                  child: Image(image: AssetImage('assets/Profile.png')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
