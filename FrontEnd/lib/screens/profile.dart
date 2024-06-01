import 'package:flutter/material.dart';
import 'package:midassist/screens/home.dart';
import 'package:midassist/screens/custom_bottom_navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
                //back bitton
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
                  width: 50,
                ),
                //market text
                const Text(
                  'Profile Update',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Positioned(
              top: 80,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Edit Your Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ))),
          const Positioned(
              top: 130,
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),

          Positioned(
            top: 175,
            left: 10,
            right: 10,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 173, 170, 170)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          //Navigation Bar
          Positioned(
            top: 728,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(),
          )
        ],
      ),
    );
  }
}
