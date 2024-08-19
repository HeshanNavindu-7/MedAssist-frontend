import 'package:flutter/material.dart';
import 'package:midassist/screens/appointments.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';
import 'package:midassist/screens/doctor_card.dart';

class MyAppo extends StatefulWidget {
  const MyAppo({Key? key}) : super(key: key);

  @override
  _MyAppoState createState() => _MyAppoState();
}

class _MyAppoState extends State<MyAppo> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 25,
            left: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // back button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage('assets/back.png'),
                    height: 50,
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                // title text
                const Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // search bar
          Positioned(
            top: 80,
            left: 10,
            right: 10,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: _isFocused ? '' : 'Search for appointments...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // appointment cards
          Positioned(
            top: 170,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  DoctorCard(
                    doctorName: "Dr. John Doe",
                    specialty: "Cardiologist",
                    distance: "800m away",
                    imagePath: 'assets/doc.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Appointments(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 40),
                  DoctorCard(
                    doctorName: "Dr. Jane Smith",
                    specialty: "Cardiologist",
                    distance: "800m away",
                    imagePath: 'assets/doc.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Appointments(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
