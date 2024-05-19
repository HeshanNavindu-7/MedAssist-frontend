import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({Key? key}) : super(key: key);

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
                //back button
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
                  width: 65,
                ),
                //market text
                const Text(
                  'Hospitals',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Positioned(
            top: 70,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "We're here to help with anything and \neverything on MedAssist.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          //search bar
          Positioned(
            top: 150,
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
                  hintText: 'Search for hospitals...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ),
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
                SizedBox(
                  height: 20,
                ),
                FaqItem(
                  question: 'General Hospital Matale',
                ),
                SizedBox(
                  height: 15,
                ),
                FaqItem(
                  question: 'Asiri Hospitals Kandy',
                ),
                SizedBox(
                  height: 15,
                ),
                FaqItem(
                  question: 'Suwa Sewana Hospitals Kandy',
                ),
                SizedBox(
                  height: 15,
                ),
                FaqItem(
                  question: 'Kumudu Hospitaals Matale',
                ),
                SizedBox(
                  height: 15,
                ),
                FaqItem(
                  question: 'Lanka Hospitals Kandy',
                ),
              ],
            ),
          ),

          const Positioned(
              top: 570,
              left: 20,
              child: Column(
                children: [
                  Text(
                    'Still stuck? Help is a mail away.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Image(image: AssetImage('assets/helpmessage.png'))
                ],
              )),
          //Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          )
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
