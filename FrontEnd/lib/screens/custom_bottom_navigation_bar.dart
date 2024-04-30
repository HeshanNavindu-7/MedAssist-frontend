import 'package:flutter/material.dart';
import 'package:midassist/screens/doctorRecommendation.dart';
import 'package:midassist/screens/market.dart';
import 'package:midassist/screens/profilepage.dart';
import 'package:midassist/screens/medassistai.dart';
import 'package:midassist/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:midassist/APIs/imageFilePicker.dart';
import 'package:midassist/screens/imageUploder.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  CustomBottomNavigationBar({super.key});

  @override
  _CustomBottomNavigationBar createState() => _CustomBottomNavigationBar();
}


class _CustomBottomNavigationBar extends State<CustomBottomNavigationBar> {
  final ImageFilePicker imageFilePicker = ImageFilePicker();
  final http.Client client = http.Client();

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
                    builder: (context) => ImageUploder(
                        imageFilePicker: imageFilePicker,
                        client: client), // Corrected class name
                  ));
            },
            child:
            const Image(image: AssetImage('assets/Camera.png')),
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