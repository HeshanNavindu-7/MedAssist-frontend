import 'package:flutter/material.dart';
import 'package:midassist/screens/appointmentdetails.dart';
import 'package:midassist/screens/appointments.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

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

  Widget _buildAppointmentCard(BuildContext context, String doctorName) {
    return SizedBox(
      width: 150,
      height: 200,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(
              255, 227, 227, 227), // New color for the doctor card
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Appoinments()),
                );
              },
              child: const Image(
                image: AssetImage('assets/doc.png'),
                height: 100,
                width: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                doctorName,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Cardiologist',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage('assets/Rating.png')),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage('assets/Location.png')),
                ),
                Text(
                  '800m away',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
                    hintText:
                        _isFocused ? '' : 'Search doctor, drugs, articles...',
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildAppointmentCard(context, "Dr. John Doe"),
                    const SizedBox(width: 40),
                    _buildAppointmentCard(context, "Dr. Jane Smith"),
                  ],
                ),
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
