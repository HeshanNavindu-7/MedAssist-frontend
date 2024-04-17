import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/profilepage.dart';

class Appoinments extends StatelessWidget {
  const Appoinments({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appoinmentback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            //Background with navigation bar
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
            //New appointment
            Positioned(
              top: 10,
              right: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20), // Adjusted padding
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
                      width: 50,
                    ),
                    const Text(
                      'New Appointment',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
                top: 80,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text('July, 2020'),
                      SizedBox(
                        width: 10,
                      ),
                      Image(image: AssetImage('assets/downarrow.png'))
                    ],
                  ),
                )),
            const Positioned(
                top: 120,
                left: 15,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/day1.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/day2.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/day3.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/day4.png'),
                    )
                  ],
                )),
            const Positioned(
                top: 230,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Available Time',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
            const Positioned(
                top: 260,
                left: 30,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/9am.png'),
                      ),
                    ),
                    Image(
                      image: AssetImage('assets/930am.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/10am.png'),
                      ),
                    )
                  ],
                )),
            const Positioned(
                top: 310,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Patient Details',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
