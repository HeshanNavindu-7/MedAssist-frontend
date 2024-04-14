import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

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
        child: const Stack(
          children: [
            Positioned(
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
                    padding: EdgeInsets.only(top: 715, left: 20),
                    child: Image(image: AssetImage('assets/Home.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 40),
                    child: Image(image: AssetImage('assets/Market.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Camera.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 10),
                    child: Image(image: AssetImage('assets/Ai.png')),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 715, left: 30),
                    child: Image(image: AssetImage('assets/Profile.png')),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 80,
                left: 150,
                child: Image(image: AssetImage('assets/profilegirl.png'))),
            Positioned(
                top: 170,
                left: 150,
                child: Text(
                  'Amelia Reneta',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Positioned(
              top: 200,
              left: 50,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0),
                          child:
                              Image(image: AssetImage('assets/Heartbeat.png'))),
                      Text('Heart Rate\n   215bpm'),
                    ],
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Image(image: AssetImage('assets/Fire.png'))),
                      Text('Calories\n  756cal'),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 0),
                          child:
                              Image(image: AssetImage('assets/Barbell.png'))),
                      Text('Weight\n103lbs'),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Column(
                children: [
                  //Mysaved part
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Heart.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'My Saved',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //Appointment part
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Appointments.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Appointments',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 120,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //Payment method
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Payment.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Payment Method',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //FAQs
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Faqs.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'FAQs',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 175,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //LogOut
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Image(
                        image: AssetImage('assets/Logout.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            color: Color.fromARGB(255, 251, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 165,
                      ),
                      Image(
                        image: AssetImage('assets/Arrow.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
