import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  _HospitalsState createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
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
              children: [
                // Back button
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
                const SizedBox(width: 65),
                // Title text
                const Text(
                  'Hospitals',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 70,
            left: 16,
            right: 16,
            child: Text(
              "We're here to help with anything and \neverything on MedAssist.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // Search bar
          Positioned(
            top: 130,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  hintText: _isFocused ? '' : 'Search for hospitals...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Hospitals list
          const Positioned(
            top: 230,
            left: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hospitals near you',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                FaqItem(question: 'General Hospital Matale'),
                SizedBox(height: 15),
                FaqItem(question: 'Asiri Hospitals Kandy'),
                SizedBox(height: 15),
                FaqItem(question: 'Suwa Sewana Hospitals Kandy'),
                SizedBox(height: 15),
                FaqItem(question: 'Kumudu Hospitals Matale'),
                SizedBox(height: 15),
                FaqItem(question: 'Lanka Hospitals Kandy'),
              ],
            ),
          ),
          // Send a Message Button
          Positioned(
            top: 600,
            left: 70,
            right: 70,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black12),
                ),
                child: const Center(
                  child: Text(
                    'Send a Message',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Navigation Bar
          const Positioned(
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

class FaqItem extends StatelessWidget {
  final String question;

  const FaqItem({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(question),
        ),
        const SizedBox(
          width: 20,
        ),
        const Image(
          image: AssetImage('assets/downarr.png'),
          width: 20,
        ),
      ],
    );
  }
}
