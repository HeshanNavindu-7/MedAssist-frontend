import 'package:flutter/material.dart';
import 'package:midassist/screens/doctorRecommendation.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:http/http.dart' as http;


import 'imageUploder.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final ImageFilePicker imageFilePicker = ImageFilePicker();
  final http.Client client = http.Client();

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
              padding: EdgeInsets.all(15), // Added 'const'
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Hello, Hesh',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Image(
                    image: AssetImage('assets/notification.png'),
                    height: 50,
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
          const Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Doctor.png'),
                      height: 100,
                      width: 50,
                    ),
                    Text(
                      'Doctor',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Pharmacy.png'),
                      height: 100,
                      width: 50,
                    ),
                    Text(
                      'Pharmacy',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Hospital.png'),
                      height: 100,
                      width: 50,
                    ),
                    Text(
                      'Hospital',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/Ambulance.png'),
                      height: 100,
                      width: 50,
                    ),
                    Text(
                      'Ambulance',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Positioned(
            top: 230,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/Learn_more.png'),
                  height: 200,
                ),
              ],
            ),
          ),
          Positioned(
            top: 420,
            left: 30,
            right: 0,
            child: Row(
              children: [
                const Text(
                  'Top Doctors',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 180,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const DoctorRecommendation()), // Corrected class name
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
                                Home()), // Corrected class name
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
                  padding: const EdgeInsets.only(top: 715, left: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageUploder(
                                imageFilePicker: imageFilePicker,
                                client: client), // Corrected class name
                          ));
                    },
                    child: const Image(image: AssetImage('assets/Camera.png')),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 715, left: 40),
                  child: Image(image: AssetImage('assets/GlovaAI.png')),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProfilePage()), // Corrected class name
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Profile.png')),
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
