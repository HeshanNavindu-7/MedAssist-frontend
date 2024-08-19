import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:midassist/screens/aboutdoctor.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  // Tracks the number of selected stars
  int _selectedStars = 0;

  // Tracks the selected state of MedAssist
  bool _isMedAssist = false;

  // Tracks the state of the checkbox
  bool _isChecked = false;

  // Function to build a row of stars
  Widget _buildStarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedStars = index + 1;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image(
              image: AssetImage(_selectedStars > index
                  ? 'assets/goldstar1.png'
                  : 'assets/goldstar.png'),
              width: 30,
              height: 30,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/appoinmentback.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Navigation bar
            Positioned(
              top: 728,
              left: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            ),
            // Small doc image
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
            // Text 1
            const Positioned(
              top: 160,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'How likely you recommend Dr. Marcus?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Review stars
            Positioned(
              top: 190,
              left: 85,
              child: _buildStarRow(),
            ),
            // Title
            const Positioned(
              top: 210,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Review Title',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Review Title TextField
            Positioned(
              top: 240,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your title',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // Tell More
            const Positioned(
              top: 300,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tell us more about your visit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Visit Details TextField
            Positioned(
              top: 330,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'What stood out in your visit?',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // MedAssist?
            const Positioned(
              top: 390,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Was this a MedAssist appointment?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 420,
              left: 95,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isMedAssist = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          _isMedAssist ? Colors.white : Colors.black,
                      backgroundColor:
                          _isMedAssist ? Colors.blueAccent : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('Yes'),
                  ),
                  const SizedBox(width: 40),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isMedAssist = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          !_isMedAssist ? Colors.white : Colors.black,
                      backgroundColor:
                          !_isMedAssist ? Colors.blueAccent : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('No'),
                  ),
                ],
              ),
            ),
            // Email
            const Positioned(
              top: 455,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'E-mail',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // Email TextField
            Positioned(
              top: 490,
              left: 10,
              right: 10,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your E-mail',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 173, 170, 170)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            // Bottom text
            const Positioned(
              top: 555,
              left: 60,
              child: Text(
                '(Your email is for confirm your review, will NOT appear on the review)',
                style: TextStyle(fontSize: 10),
              ),
            ),
            // Checkbox
            Positioned(
              top: 575,
              left: 10,
              child: Row(children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Text(
                    'I verify that I or my family member have received treatment from \nthis doctor and agree to the MedAssist User Agreement, Editorial \nPolicy and privacy policy.',
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ]),
            ),
            // Save and Submit
            Positioned(
              top: 635,
              left: 70,
              child: GestureDetector(
                onTap: () {
                  // Handle the 'Save and submit' action here
                },
                child: Container(
                  width: 250,
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Center(
                    child: Text(
                      'Save and submit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Back button
            Positioned(
              top: 35,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutDoctor(),
                    ),
                  );
                },
                child: const Image(
                  image: AssetImage('assets/back.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
