import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midassist/screens/appointments.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/reviewdoctor.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profileback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
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
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 715, left: 20),
                      child: Image(image: AssetImage('assets/Home.png')),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 715, left: 40),
                    child: Image(image: AssetImage('assets/Market.png')),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Camera.png')),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MedAssistAi(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 715, left: 10),
                      child: Image(image: AssetImage('assets/Ai.png')),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
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
            const Positioned(
              top: 50,
              left: 150,
              child: Image(image: AssetImage('assets/smalldoc.png')),
            ),
            const Positioned(
              top: 170,
              left: 150,
              child: Text(
                'Dr. Marcus Holmes',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 190,
              left: 152,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Review(),
                    ),
                  );
                },
                child: const Text(
                  'Review this doctor',
                  style: TextStyle(color: Color.fromARGB(255, 14, 99, 236)),
                ),
              ),
            ),
            const Positioned(
              top: 220,
              left: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/patient.png')),
                      ),
                      Text(' 10000+\nPatients'),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/years.png')),
                      ),
                      Text('  10 Years+\n Experience'),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 0),
                        child: Image(image: AssetImage('assets/star.png')),
                      ),
                      Text('   4.5\nRating'),
                    ],
                  ),
                ],
              ),
            ),
            const Positioned(
              top: 290,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'About Doctor',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 310,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    'Dr. Marcus Holmes is a top specialist at London Bridge \nHospital at London. He has achieved several awards and \nrecognition for his contribution in his own field.'),
              ),
            ),
            const Positioned(
              top: 380,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Working Time',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 400,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Mon - Sat (08:30 AM - 09:00 PM)'),
              ),
            ),
            const Positioned(
              top: 425,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Communication',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 450,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/message.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Messaging\nChat me up, share photos.'),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 505,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/call.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Audio Call\nCall your doctor directly.'),
                  )
                ],
              ),
            ),
            const Positioned(
              top: 560,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 45, top: 10),
                    child: Image(
                      image: AssetImage('assets/video.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Video Call\nSee your doctor live.'),
                  )
                ],
              ),
            ),
            Positioned(
              top: 615,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Appoinments(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                  child: Image(
                    image: AssetImage('assets/appointment.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
