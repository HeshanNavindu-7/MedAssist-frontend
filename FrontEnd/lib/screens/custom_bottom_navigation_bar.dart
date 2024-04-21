import 'package:flutter/material.dart';
import 'package:midassist/screens/doctorRecommendation.dart';
import 'package:midassist/screens/market.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/home.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //adjestments
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Bottom_rectangle.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Home
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            child: const Image(image: AssetImage('assets/Home.png')),
          ),
          //market
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Market()),
              );
            },
            child: const Image(image: AssetImage('assets/Market.png')),
          ),
          //camera
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorRecommendation(),
                ),
              );
            },
            child: const Image(image: AssetImage('assets/Camera.png')),
          ),
          //ai
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MedAssistAi()),
              );
            },
            child: const Image(image: AssetImage('assets/Ai.png')),
          ),
          //profile
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Image(image: AssetImage('assets/Profile.png')),
          ),
        ],
      ),
    );
  }
}
