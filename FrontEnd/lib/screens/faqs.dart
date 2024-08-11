import 'package:flutter/material.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
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
          // Background image or container
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Back button and title
          Positioned(
            top: 25,
            left: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(width: 65),
                const Text(
                  'Help Desk',
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Introduction text
          const Positioned(
            top: 80,
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
            top: 135,
            left: 10,
            right: 10,
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
          // FAQ Section
          const Positioned(
            top: 230,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'At Viral Pitch we expect at a day’s start is you, \n'
                  'better and happier than yesterday. We have got \n'
                  'you covered share your concern or check our \n'
                  'frequently asked questions listed below.\n',
                  style: TextStyle(fontSize: 14.0, height: 1.5),
                ),
                Text(
                  'FAQ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 20),
                FaqItem(question: 'What is MedAssist?'),
                SizedBox(height: 15),
                FaqItem(
                    question: 'How to apply MedAssist to the day-to-day life?'),
                SizedBox(height: 15),
                FaqItem(question: 'Is it safe to use MedAssist?'),
                SizedBox(height: 15),
                FaqItem(question: 'What is the accuracy of MedAssist?'),
                SizedBox(height: 15),
                FaqItem(question: 'How to support MedAssist?'),
              ],
            ),
          ),
          // Help mail text and button
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Column(
              children: [
                const Text(
                  'Still stuck? Help is a mail away.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    // Handle the 'Send a message' action here
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const Center(
                      child: Text(
                        'Send a message',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
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
        const SizedBox(width: 20),
        const Image(
          image: AssetImage('assets/downarr.png'),
          width: 20,
        ),
      ],
    );
  }
}
