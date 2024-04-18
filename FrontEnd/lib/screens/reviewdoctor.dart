import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/profilepage.dart';

class Review extends StatelessWidget {
  const Review({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            //Background
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/appoinmentback.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(children: [
              //Navigation bar
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
                top: 30,
                left: 150,
                child: Image(image: AssetImage('assets/smalldoc.png')),
              ),
              const Positioned(
                top: 140,
                left: 140,
                child: Text(
                  'Dr. Marcus Holmes',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Positioned(
                top: 175,
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
                  top: 230,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'How likely you recommend Dr. Marcus?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              const Positioned(
                  top: 260,
                  left: 85,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/goldstar.png'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Image(
                          image: AssetImage('assets/goldstar.png'),
                        ),
                      )
                    ],
                  ))
            ])));
  }
}
